import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/state/figma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteLibraryProvider =
    FutureProvider.autoDispose<FigmaRemoteLibrary?>((ref) async {
  final client = await ref.watch(figmaClient.future);
  if (client == null) return null;
  return await client.getLibrary(const Library('figma', 1))
      as FigmaRemoteLibrary?;
});

final selectedComponentProvider =
    StateNotifierProvider<StateController<String?>, String?>((ref) {
  return StateController<String?>(null);
});
