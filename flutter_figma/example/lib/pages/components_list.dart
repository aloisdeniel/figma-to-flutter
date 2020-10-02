import 'package:example/pages/component_preview.dart';
import 'package:flutter/material.dart';
import 'package:figma/figma.dart' as figma;

class FileComponentsPage extends StatefulWidget {
  final String apiKey;
  final String fileKey;
  const FileComponentsPage({
    Key key,
    @required this.apiKey,
    @required this.fileKey,
  }) : super(key: key);

  @override
  _FileComponentsPageState createState() => _FileComponentsPageState();
}

class _FileComponentsPageState extends State<FileComponentsPage> {
  Future<figma.FileResponse> fileFuture;
  figma.FigmaClient client;

  @override
  void initState() {
    client = figma.FigmaClient(widget.apiKey);
    fileFuture = _loadComponents();
    super.initState();
  }

  Future<figma.FileResponse> _loadComponents() {
    return client.getFile(widget.fileKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: FutureBuilder<figma.FileResponse>(
        future: fileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return _Error(
                message: 'No data received from the API',
              );
            }
            return _ComponentsList(
              fileKey: widget.fileKey,
              components: snapshot.data.components.entries.toList(),
              apiKey: widget.apiKey,
            );
          }
          if (snapshot.error != null) {
            return _Error(
              message: snapshot.error.toString(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _Error extends StatelessWidget {
  final String message;
  const _Error({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Text(
        message,
        style: theme.textTheme.headline6.copyWith(
          color: theme.errorColor,
        ),
      ),
    );
  }
}

class _ComponentsList extends StatelessWidget {
  final String apiKey;
  final String fileKey;
  final List<MapEntry<String, figma.Component>> components;
  const _ComponentsList({
    Key key,
    @required this.apiKey,
    @required this.fileKey,
    @required this.components,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...components.map(
          (x) => _ComponentTile(
            apiKey: apiKey,
            fileKey: fileKey,
            nodeId: x.key,
            component: x.value,
            key: Key(x.key),
          ),
        ),
      ],
    );
  }
}

class _ComponentTile extends StatelessWidget {
  final String apiKey;
  final String fileKey;
  final String nodeId;
  final figma.Component component;
  const _ComponentTile({
    Key key,
    @required this.apiKey,
    @required this.fileKey,
    @required this.component,
    @required this.nodeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(component.name),
      subtitle: Text(component.key),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComponentPreviewPage(
              apiKey: apiKey,
              fileKey: fileKey,
              component: component,
              nodeId: nodeId,
            ),
          ),
        );
      },
    );
  }
}
