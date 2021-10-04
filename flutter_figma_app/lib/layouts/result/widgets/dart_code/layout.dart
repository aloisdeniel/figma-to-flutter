import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/state/result.dart';
import 'package:flutter_figma_app/theme/data.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/highlight.dart';
import 'package:flutter_figma_generator/flutter_figma_generator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DartCode extends StatefulWidget {
  const DartCode({
    Key? key,
  }) : super(key: key);

  @override
  State<DartCode> createState() => _DartCodeState();
}

class _DartCodeState extends State<DartCode> {
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

      if (selectedComponent == null) {
        return const Center(
          child: Text('No component selected'),
        );
      }

      final remoteLibrary =
          InheritedRemote.libraryOf(context, 'figma')! as FigmaRemoteLibrary;

      final source = DartFigmaCodeGenerator().generate(
        library: remoteLibrary,
        component: selectedComponent,
      );
      return SingleChildScrollView(
        controller: scrollController,
        child: SelectableHighlightView(
          source,
          language: 'dart',
          tabSize: 4,
          theme: createCodeTheme(theme),
          padding: theme.edgeInsets.regular,
          textStyle: theme.textStyle.code1,
        ),
      );
    });
  }
}

Map<String, TextStyle> createCodeTheme(AppThemeData theme) => {
      'root': TextStyle(
          backgroundColor: theme.color.background1,
          color: theme.color.foreground1),
      'keyword': TextStyle(color: theme.color.primary1),
      'selector-tag': TextStyle(color: Color(0xff8be9fd)),
      'literal': TextStyle(color: theme.color.thirdary1),
      'section': TextStyle(color: Color(0xff8be9fd)),
      'link': TextStyle(color: Color(0xff8be9fd)),
      'subst': TextStyle(color: Color(0xfff8f8f2)),
      'string': TextStyle(color: Color(0xfff1fa8c)),
      'title': TextStyle(color: theme.color.secondary1),
      'name': TextStyle(color: Color(0xfff1fa8c)),
      'type': TextStyle(color: theme.color.secondary1),
      'attribute': TextStyle(color: Color(0xfff1fa8c)),
      'symbol': TextStyle(color: Color(0xfff1fa8c)),
      'bullet': TextStyle(color: Color(0xfff1fa8c)),
      'addition': TextStyle(color: Color(0xfff1fa8c)),
      'variable': TextStyle(color: Color(0xfff1fa8c)),
      'template-tag': TextStyle(color: Color(0xfff1fa8c)),
      'template-variable': TextStyle(color: Color(0xfff1fa8c)),
      'comment': TextStyle(color: Color(0xff6272a4)),
      'quote': TextStyle(color: Color(0xff6272a4)),
      'deletion': TextStyle(color: Color(0xff6272a4)),
      'meta': TextStyle(color: Color(0xff6272a4)),
      'doctag': TextStyle(),
      'strong': TextStyle(),
      'emphasis': TextStyle(),
    };
