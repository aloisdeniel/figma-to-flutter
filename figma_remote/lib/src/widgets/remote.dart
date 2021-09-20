import 'package:figma/figma.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RemoteFigma extends StatefulWidget {
  const RemoteFigma({
    Key? key,
    required this.token,
    required this.fileId,
    required this.child,
  }) : super(key: key);

  final String token;
  final String fileId;
  final Widget child;

  static FileResponse? fileOf(BuildContext context) {
    return InheritedRemoteFigma.of(context)?.file;
  }

  @override
  _RemoteFigmaState createState() => _RemoteFigmaState();
}

class _RemoteFigmaState extends State<RemoteFigma> {
  late final api = FigmaClient(widget.token);
  late Future<FileResponse> _update;

  @override
  void didChangeDependencies() {
    _update = _refreshFile();
    super.didChangeDependencies();
  }

  Future<FileResponse> _refreshFile() async {
    final uri = Uri.https(
      base,
      '${api.apiVersion}/files/${widget.fileId}',
      const FigmaQuery(geometry: 'paths').params,
    );
    final json = await api.authenticatedGet(uri.toString());

    return FileResponse.fromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FileResponse>(
      future: _update,
      builder: (context, snapshot) => snapshot.data != null
          ? InheritedRemoteFigma(
              child: widget.child,
              file: snapshot.data!,
            )
          : Center(
              child: SizedBox(),
            ),
    );
  }
}

class InheritedRemoteFigma extends InheritedWidget {
  InheritedRemoteFigma({
    Key? key,
    required Widget child,
    required this.file,
  }) : super(
          key: key,
          child: child,
        );

  final FileResponse file;

  static InheritedRemoteFigma? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedRemoteFigma>();
  }

  @override
  bool updateShouldNotify(InheritedRemoteFigma oldWidget) {
    return file != oldWidget.file;
  }
}
