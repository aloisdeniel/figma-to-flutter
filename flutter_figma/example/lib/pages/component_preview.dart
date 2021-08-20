import 'package:flutter/material.dart';
import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/figma.dart';

class ComponentPreviewPage extends StatefulWidget {
  final String apiKey;
  final String fileKey;
  final String nodeId;
  const ComponentPreviewPage({
    Key key,
    @required this.apiKey,
    @required this.fileKey,
    @required this.nodeId,
  }) : super(key: key);

  @override
  _ComponentPreviewPageState createState() => _ComponentPreviewPageState();
}

class _ComponentPreviewPageState extends State<ComponentPreviewPage> {
  Size size;
  Axis axis;
  @override
  Widget build(BuildContext context) {
    final preview = FigmaDesignNode.node(
      id: widget.nodeId,
      builder: (context, node) => FigmaNode(
        node: node.replaceText('Title', 'Hello world!'),
      ),
    );
    final body = axis == null
        ? InteractiveViewer(
            maxScale: 10,
            child: size != null
                ? FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      height: size.height,
                      width: size.width,
                      child: preview,
                    ),
                  )
                : preview,
          )
        : ListView(
            scrollDirection: axis,
            children: [preview],
          );
    return FlutterFigma(
      token: widget.apiKey,
      child: FigmaDesignFile(
        fileId: widget.fileKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.nodeId),
          ),
          endDrawer: SizedBox(
            width: 200,
            child: Drawer(
              child: _SettingsPanel(
                size: size,
                axis: axis,
                onSizeChanged: (value) => setState(() => size = value),
                onAxisChanged: (value) => setState(() => axis = value),
              ),
            ),
          ),
          body: body,
        ),
      ),
    );
  }
}

class _SettingsPanel extends StatelessWidget {
  final ValueChanged<Size> onSizeChanged;
  final ValueChanged<Axis> onAxisChanged;
  final Size size;
  final Axis axis;
  const _SettingsPanel({
    Key key,
    @required this.size,
    @required this.axis,
    @required this.onSizeChanged,
    @required this.onAxisChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Scroll',
              style: theme.textTheme.headline6,
            ),
          ),
          ListTile(
            title: Text('None'),
            onTap: () => onAxisChanged(null),
          ),
          ListTile(
            title: Text('Scroll vertical'),
            onTap: () => onAxisChanged(Axis.vertical),
          ),
          ListTile(
            title: Text('Scroll horizontal'),
            onTap: () => onAxisChanged(Axis.horizontal),
          ),
          if (axis == null) ...[
            Divider(),
            ListTile(
              title: Text(
                'Size',
                style: theme.textTheme.headline6,
              ),
            ),
            ListTile(
              title: Text('Fill'),
              onTap: () => onSizeChanged(null),
            ),
            _SizeTile(
              size: Size(64, 64),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(128, 64),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(64, 128),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(128, 128),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(256, 128),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(128, 256),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(256, 256),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(512, 256),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(256, 512),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(512, 512),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(1024, 512),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(512, 1024),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(1024, 1024),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(2048, 1024),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(1024, 2048),
              onSizeChanged: onSizeChanged,
            ),
            _SizeTile(
              size: Size(2048, 2048),
              onSizeChanged: onSizeChanged,
            ),
          ],
        ],
      ),
    );
  }
}

class _SizeTile extends StatelessWidget {
  final Size size;
  final ValueChanged<Size> onSizeChanged;
  const _SizeTile({
    Key key,
    @required this.size,
    @required this.onSizeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${size.width}x${size.height}'),
      onTap: () => onSizeChanged(size),
    );
  }
}
