import 'package:flutter_figma_app/state/preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

bool notEmpty(String? value) => value != null && value.trim().isNotEmpty;

typedef FieldValidator<TError> = TError? Function(String? value);

class FieldProviders<TError> {
  factory FieldProviders(
    String key, {
    FieldValidator? validator,
  }) {
    final value =
        StateNotifierProvider<FieldNotifier, AsyncValue<String?>>((ref) {
      return FieldNotifier(ref.read, key);
    });

    final validatorProvider = FutureProvider<TError?>((ref) async {
      final field = ref.watch(value);
      return field.map(
        data: (data) => validator!.call(data.value),
        loading: (_) => throw Exception(),
        error: (e) => throw Exception(),
      );
    });

    return FieldProviders._(
      key,
      value,
      validatorProvider,
    );
  }

  const FieldProviders._(
    this.preferenceKey,
    this.value,
    this.validator,
  );

  final String preferenceKey;
  final StateNotifierProvider<FieldNotifier, AsyncValue<String?>> value;
  final FutureProvider<TError?> validator;
}

class FieldNotifier extends StateNotifier<AsyncValue<String?>> {
  FieldNotifier(
    this.read,
    this.preferenceKey,
  ) : super(const AsyncValue<String?>.loading()) {
    _initialize();
  }

  final Reader read;
  final String preferenceKey;

  void _initialize() async {
    try {
      final prefs = await read(sharedPreferences.future);
      state = AsyncValue<String?>.data(prefs.getString(preferenceKey));
    } catch (e, st) {
      state = AsyncValue<String?>.error(e, st);
    }
  }

  Future<void> update(String? value) async {
    state = AsyncValue<String?>.data(value);
    final prefs = await read(sharedPreferences.future);
    if (value == null) {
      await prefs.remove(preferenceKey);
    } else {
      await prefs.setString(preferenceKey, value);
    }
  }
}
