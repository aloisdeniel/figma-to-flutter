// ignore_for_file: prefer_initializing_formals

import 'dart:convert';

import 'package:figma/figma.dart' as figma;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class RemoteFigma extends StatefulWidget {
  const RemoteFigma({
    Key? key,
    required String token,
    required String fileId,
    required this.child,
  })  : token = token,
        fileId = fileId,
        assetName = null,
        super(key: key);

  const RemoteFigma.fromAsset({
    Key? key,
    String assetName = 'assets/figma_keys.json',
    required this.child,
  })  : token = null,
        fileId = null,
        assetName = assetName,
        super(key: key);

  final String? token;
  final String? fileId;
  final String? assetName;
  final Widget child;

  static figma.FileResponse? fileOf(BuildContext context) {
    return InheritedRemoteFigma.of(context)?.file;
  }

  static Map<String, String>? imagesOf(BuildContext context) {
    return InheritedRemoteFigma.of(context)?.images;
  }

  @override
  _RemoteFigmaState createState() => _RemoteFigmaState();
}

class _RemoteFigmaState extends State<RemoteFigma> {
  late final figma.FigmaClient api;
  late Future<_RemoteFigmaData> _update;
  late final String fileId;
  String? token;

  @override
  void didChangeDependencies() {
    _update = _refresh();
    super.didChangeDependencies();
  }

  Future<void> _initTokens() async {
    if (token == null) {
      if (widget.token != null) {
        token = widget.token!;
        fileId = widget.fileId!;
      } else {
        final config = await rootBundle.loadString(widget.assetName!);
        final json = jsonDecode(config);
        token = json['token'];
        fileId = json['fileId'];
      }
    }
  }

  Future<_RemoteFigmaData> _refresh() async {
    await _initTokens();
    api = figma.FigmaClient(token!);
    final file = await _refreshFile();
    final images = await _refreshImages();
    return _RemoteFigmaData(
      file: file,
      images: images,
    );
  }

  Future<Map<String, String>?> _refreshImages() async {
    final uri = Uri.https(
      figma.base,
      '${api.apiVersion}/files/$fileId/images',
    );
    final json = await api.authenticatedGet(uri.toString());
    return <String, String>{
      ...json['meta']['images'],
    };
  }

  Future<figma.FileResponse> _refreshFile() async {
    final uri = Uri.https(
      figma.base,
      '${api.apiVersion}/files/$fileId',
      const figma.FigmaQuery(geometry: 'paths').params,
    );
    final json = await api.authenticatedGet(uri.toString());

    return figma.FileResponse.fromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_RemoteFigmaData>(
      future: _update,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return InheritedRemoteFigma(
            child: widget.child,
            file: snapshot.data!.file,
            images: snapshot.data!.images,
          );
        }
        if (snapshot.hasError) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Figma: ${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class InheritedRemoteFigma extends InheritedWidget {
  const InheritedRemoteFigma(
      {Key? key,
      required Widget child,
      required this.file,
      required this.images})
      : super(
          key: key,
          child: child,
        );

  final figma.FileResponse file;
  final Map<String, String>? images;

  static InheritedRemoteFigma? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedRemoteFigma>();
  }

  @override
  bool updateShouldNotify(InheritedRemoteFigma oldWidget) {
    return file != oldWidget.file || images != oldWidget.images;
  }
}

class _RemoteFigmaData {
  _RemoteFigmaData({
    required this.file,
    required this.images,
  });

  final figma.FileResponse file;
  final Map<String, String>? images;
}
