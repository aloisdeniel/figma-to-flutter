import 'package:figma_remote/src/converters/library/library.dart';
import 'package:figma_remote/src/rfw_addons/widgets.dart';
import 'package:figma_remote/src/widgets/remote.dart';
import 'package:flutter/widgets.dart';
import 'package:rfw/rfw.dart';

class RemoteFigmaComponent extends StatefulWidget {
  const RemoteFigmaComponent({
    Key? key,
    required this.componentName,
    this.data = const RemoteFigmaData(),
    this.theme = const RemoteFigmaTheme(),
    this.variants = const <String, String>{},
    this.renderer,
  }) : super(key: key);

  final String componentName;
  final Map<String, String> variants;
  final RemoteFigmaData data;
  final RemoteFigmaTheme theme;
  final ComponentRenderer? renderer;

  @override
  _RemoteFigmaComponentState createState() => _RemoteFigmaComponentState();
}

class _RemoteFigmaComponentState extends State<RemoteFigmaComponent> {
  final Runtime _runtime = Runtime();
  FigmaRemoteLibrary? _library;
  late Future<void> future;

  @override
  void initState() {
    super.initState();
    _runtime.update(
      const LibraryName(<String>['core', 'widgets']),
      createCoreWidgets(),
    );
    _runtime.update(
      const LibraryName(<String>['addons', 'widgets']),
      createCoreAddonsWidgets(widget.renderer),
    );
  }

  @override
  void didChangeDependencies() {
    reloadFigmaLibrary();
    super.didChangeDependencies();
  }

  void reloadFigmaLibrary() {
    final file = RemoteFigma.fileOf(context);
    _library = FigmaRemoteLibrary(
      file: file!,
      componentName: widget.componentName,
    );
    _runtime.update(
      const LibraryName(<String>['figma']),
      _library!.library,
    );
  }

  DynamicMap _buildData() {
    var data = <String, Object?>{};

    if (_library != null) {
      final values = _library!.componentDefaultData[widget.componentName]!;
      final variantKey = VariantDefinition.createKey(widget.variants);
      final variantValues = values[variantKey];
      data.addAll(variantValues!.toMap());
    }

    final dataMap = widget.data.asMap();
    if (dataMap.isNotEmpty) {
      for (var item in dataMap.entries) {
        final defaultValues = data[item.key];
        final values = item.value;
        data[item.key] = {
          if (defaultValues is DynamicMap) ...defaultValues,
          if (values is DynamicMap) ...values,
        };
      }
    }

    return data;
  }

  DynamicMap _buildTheme() {
    var result = <String, Object?>{};

    if (_library != null) {
      final values = _library!.componentDefaultTheme[widget.componentName]!;
      final variantKey = VariantDefinition.createKey(widget.variants);
      final variantValues = values[variantKey];
      result.addAll(variantValues!.toMap());
    }

    final dataMap = widget.theme.asMap();
    if (dataMap.isNotEmpty) {
      for (var item in dataMap.entries) {
        final defaultValues = result[item.key];
        final values = item.value;
        result[item.key] = {
          if (defaultValues is DynamicMap) ...defaultValues,
          if (values is DynamicMap) ...values,
        };
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final data = DynamicContent({
      'variants': [
        ...widget.variants.entries.map((x) => {
              'name': x.key,
              'value': x.value,
            }),
      ],
      'data': _buildData(),
      'theme': _buildTheme(),
    });
    return RemoteWidget(
      runtime: _runtime,
      data: data,
      widget: FullyQualifiedWidgetName(
        const LibraryName(<String>['figma']),
        widget.componentName,
      ),
      onEvent: (String name, DynamicMap arguments) {
        debugPrint('user triggered event "$name" with data: $arguments');
      },
    );
  }
}

class RemoteFigmaData {
  const RemoteFigmaData({
    this.text = const <String, String>{},
  });

  final Map<String, String> text;

  Map<String, Object?> asMap() => {
        'text': text,
      };
}

class RemoteFigmaTheme {
  const RemoteFigmaTheme({
    this.textStyles = const <String, TextStyle>{},
  });

  final Map<String, TextStyle> textStyles;

  DynamicMap asMap() => {
        'textStyles': textStyles.map<String, Object?>(
          (key, value) => MapEntry<String, Object?>(
            key,
            {
              if (value.fontSize != null) 'fontSize': value.fontSize,
              if (value.fontWeight != null)
                'fontWeight': 'w${(value.fontWeight!.index + 1) * 100}',
              if (value.fontFamily != null) 'fontFamily': value.fontFamily,
            },
          ),
        ),
      };
}
