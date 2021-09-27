// ignore_for_file: prefer_initializing_formals

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:figma/figma.dart' as figma;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/naming.dart';
import 'package:flutter_figma/src/remote/remote.dart';
import 'package:flutter_figma/src/remote/services/figma.dart';

class FigmaRemote extends StatefulWidget {
  const FigmaRemote({
    Key? key,
    required String token,
    required String fileId,
    required this.child,
  })  : token = token,
        fileId = fileId,
        assetName = null,
        super(key: key);

  const FigmaRemote.fromAsset({
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

  static String nameForVariants(
      String componentName, Map<String, String> variants) {
    componentName = componentName.asClassName();

    final properties =
        variants.entries.sorted((x, y) => x.key.compareTo(y.key));

    return componentName.asClassName() +
        '_' +
        properties
            .map(
              (x) =>
                  x.key.asClassName().replaceAll('_', '') +
                  '_' +
                  x.value.asClassName().replaceAll('_', ''),
            )
            .join('');
  }

  @override
  _RemoteFigmaState createState() => _RemoteFigmaState();
}

class _RemoteFigmaState extends State<FigmaRemote> {
  late final figma.FigmaClient api;
  late Future<void> _update;
  late final String fileId;
  String? token;

  @override
  void didChangeDependencies() {
    _update = _initTokens();
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _update,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
          return Remote(
            client: FigmaLibraryClient(
              fileId: fileId,
              token: token!,
            ),
            child: widget.child,
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
