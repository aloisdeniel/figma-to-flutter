import 'package:example/pages/component_preview.dart';
import 'package:flutter/material.dart';
import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/flutter_figma.dart';

class FileComponentsPage extends StatefulWidget {
  final String apiKey;
  final String fileKey;
  const FileComponentsPage({
    Key? key,
    required this.apiKey,
    required this.fileKey,
  }) : super(key: key);

  @override
  _FileComponentsPageState createState() => _FileComponentsPageState();
}

class _FileComponentsPageState extends State<FileComponentsPage> {
  late Future<figma.FileResponse> fileFuture;
  late figma.FigmaClient client;

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
              apiKey: widget.apiKey,
              file: snapshot.data!,
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
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Text(
        message,
        style: theme.textTheme.headline6?.copyWith(
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
  final figma.FileResponse file;
  _ComponentsList({
    Key? key,
    required this.apiKey,
    required this.fileKey,
    required this.file,
  })  : components = file.components?.entries.toList() ?? [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final components = this.components;
    components.sort((x, y) => x.value.name!.compareTo(y.value.name!));
    return ListView(
      children: [
        ...components
            .map<List<Widget>>(
              (x) => [
                _ComponentTile(
                  apiKey: apiKey,
                  fileKey: fileKey,
                  nodeId: x.key,
                  name: x.value.name!,
                  type: 'Component',
                  key: Key(x.key),
                ),
                if (file.document != null)
                  ...file.document!.findInstances(x.key).map(
                        (y) => _ComponentTile(
                          apiKey: apiKey,
                          fileKey: fileKey,
                          nodeId: y.id,
                          name: y.name!,
                          type: '${x.value.name} (Instance)',
                          key: Key(y.id),
                        ),
                      ),
                Divider(
                  thickness: 2,
                ),
              ],
            )
            .expand((x) => x),
      ],
    );
  }
}

class _ComponentTile extends StatelessWidget {
  final String apiKey;
  final String fileKey;
  final String nodeId;
  final String name;
  final String type;
  const _ComponentTile({
    Key? key,
    required this.apiKey,
    required this.fileKey,
    required this.name,
    required this.type,
    required this.nodeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(type),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComponentPreviewPage(
              apiKey: apiKey,
              fileKey: fileKey,
              nodeId: nodeId,
            ),
          ),
        );
      },
    );
  }
}
