import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/state/helpers/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base/fields.dart';

final figma = FigmaProvider._();

class FigmaProvider {
  FigmaProvider._();

  late final apiToken = FieldProviders<bool>(
    'figma_api_token',
    validator: notEmpty,
  );

  late final fileId = FieldProviders<bool>(
    'figma_file_id',
    validator: notEmpty,
  );

  late final credentials = StateNotifierProvider<
      StateController<FigmaCredentials?>, FigmaCredentials?>((ref) {
    return StateController<FigmaCredentials?>(null);
  });

  late final client = FutureProvider<FigmaLibraryClient?>(
    (ref) async {
      final credentials = ref.watch(this.credentials);
      if (credentials == null) throw Exception('No credentials');
      return FigmaLibraryClient(
        token: credentials.apiToken,
        fileId: credentials.fileId,
      );
    },
  );

  Future<void> openFile(WidgetRef ref) async {
    final apiToken = await ref.wait(this.apiToken.value);
    final fileId = await ref.wait(this.fileId.value);
    if (apiToken == null || fileId == null) {
      throw Exception('Invalid credentials');
    }
    ref.read(credentials.notifier).state = FigmaCredentials(
      apiToken: apiToken,
      fileId: fileId,
    );
  }

  void closeFile(WidgetRef ref) {
    ref.read(credentials.notifier).state = null;
  }
}

class FigmaCredentials {
  const FigmaCredentials({
    required this.apiToken,
    required this.fileId,
  });
  final String apiToken;
  final String fileId;
}
