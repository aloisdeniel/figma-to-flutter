import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/state/result.dart';
import 'package:flutter_figma_app/widgets/resizable_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultPreview extends ConsumerWidget {
  const ResultPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedComponent = ref.watch(selectedComponentProvider);

    if (selectedComponent == null) {
      return const Center(
        child: Text('No component selected'),
      );
    }

    return ClipRect(
      child: () {
        if (selectedComponent is FigmaComponent) {
          return Resizable(
            initialSize: const Size(300, 300),
            child: RemoteWidgetPreview(
              data: selectedComponent.defaultData,
              fallbackBuilder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
              remoteIdentifier: 'figma',
              remoteWidgetName: selectedComponent.name,
            ),
          );
        }
        if (selectedComponent is FigmaComponentVariant) {
          return Resizable(
            initialSize: const Size(300, 300),
            child: RemoteWidgetPreview(
              data: selectedComponent.defaultData,
              fallbackBuilder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
              remoteIdentifier: 'figma',
              remoteWidgetName: selectedComponent.declaration.name,
            ),
          );
        }
        throw Exception('Not supported');
      }(),
    );
  }
}
