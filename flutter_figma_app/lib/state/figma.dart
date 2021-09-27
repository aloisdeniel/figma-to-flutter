import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/state/helpers/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base/fields.dart';

final figmaApiToken = FieldProviders<bool>(
  'figma_api_token',
  validator: notEmpty,
);

final figmaFileId = FieldProviders<bool>(
  'figma_file_id',
  validator: notEmpty,
);

final figmaClient = FutureProvider<FigmaLibraryClient?>((ref) async {
  final token = await ref.wait<String?>(figmaApiToken.value);
  final fileId = await ref.wait<String?>(figmaFileId.value);

  if (token == null || token.trim().isEmpty) {
    return null;
  }
  if (fileId == null || fileId.trim().isEmpty) {
    return null;
  }

  return FigmaLibraryClient(
    token: token,
    fileId: fileId,
  );
});
