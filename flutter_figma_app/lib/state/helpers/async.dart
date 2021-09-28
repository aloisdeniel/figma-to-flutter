import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueExtensions<T> on AsyncValue<T> {
  /// Convert two async value of type [T] and [O] to a single async value of type [K].
  AsyncValue<K> mergeValues2<O, K>(
          AsyncValue<O> other, K Function(T value, O v2) convert) =>
      map(
        data: (d1) => other.map(
          data: (d2) => AsyncValue<K>.data(convert(d1.value, d2.value)),
          loading: (loading) => AsyncValue<K>.loading(),
          error: (error) => AsyncValue<K>.error(error),
        ),
        loading: (loading) => AsyncValue<K>.loading(),
        error: (error) => AsyncValue<K>.error(error),
      );
}

extension ProviderRefBaseExtension on ProviderRefBase {
  Future<T> wait<T>(AlwaysAliveProviderListenable<AsyncValue<T>> provider) {
    final completer = Completer<T>();
    onDispose(() {
      if (!completer.isCompleted) {
        completer.completeError(
          StateError(
            'the provider did not emit a value',
          ),
        );
      }
    });

    late void Function() removeListener;
    removeListener = listen<AsyncValue<T>>(provider, (value) {
      value.when(
        loading: () {},
        data: (value) {
          removeListener();
          completer.complete(value);
        },
        error: (err, stack) {
          removeListener();
          completer.completeError(err, stack);
        },
      );
    });

    return completer.future;
  }
}

extension WidgetRefBaseExtension on WidgetRef {
  Future<T> wait<T>(ProviderBase<AsyncValue<T>> provider) {
    final completer = Completer<T>();

    void onChange(AsyncValue<T> value) {
      value.when(
        loading: () {},
        data: (value) {
          completer.complete(value);
        },
        error: (err, stack) {
          completer.completeError(err, stack);
        },
      );
    }

    final v = read(provider);
    listen<AsyncValue<T>>(provider, onChange);
    onChange(v);

    return completer.future;
  }
}
