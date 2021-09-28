import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/state/figma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteLibraryProvider = FutureProvider.autoDispose<FigmaRemoteLibrary?>(
  (ref) async {
    final client = await ref.watch(figma.client.future);
    if (client == null) throw Exception('No available client');
    return await client.getLibrary(const Library('figma', 1))
        as FigmaRemoteLibrary?;
  },
);

final selectedComponentProvider = StateNotifierProvider<
    StateController<FigmaComponentBase?>, FigmaComponentBase?>(
  (ref) {
    return StateController<FigmaComponentBase?>(null);
  },
);
