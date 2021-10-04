import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/state/result.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/spacing.dart';
import 'package:flutter_figma_generator/flutter_figma_generator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RfwCode extends StatefulWidget {
  const RfwCode({
    Key? key,
  }) : super(key: key);
  @override
  State<RfwCode> createState() => _DartCodeState();
}

class _DartCodeState extends State<RfwCode> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Consumer(builder: (context, ref, _) {
      final selectedComponent = ref.watch(selectedComponentProvider);

      if (selectedComponent == null || selectedComponent is FigmaComponentSet) {
        return const Center(
          child: Text('No component selected'),
        );
      }

      final declaration = () {
        if (selectedComponent is FigmaComponent) {
          return selectedComponent.declaration;
        }

        if (selectedComponent is FigmaComponentVariant) {
          return selectedComponent.declaration;
        }

        throw Exception('Not supported');
      }();

      final remoteLibrary =
          InheritedRemote.libraryOf(context, 'figma')! as FigmaRemoteLibrary;

      final code = RfwFigmaCodeGenerator().generate(
        library: FigmaRemoteLibrary.fromDetails(
          imports: remoteLibrary.imports,
          widgets: [declaration],
          images: remoteLibrary.images,
          components: remoteLibrary.components,
          componentSets: remoteLibrary.componentSets,
        ),
        component: selectedComponent,
      );

      return SingleChildScrollView(
        controller: scrollController,
        child: AppPadding.regular(
          child: SelectableText(
            code,
            style: theme.textStyle.code1,
          ),
        ),
      );
    });
  }
}
