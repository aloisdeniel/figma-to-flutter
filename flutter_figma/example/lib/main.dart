import 'package:flutter_figma/figma.dart';
import 'package:flutter/material.dart';

import 'private.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Figma Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DesignHomePage(),
    );
  }
}

class DesignHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Figma(
        token: figmaApiToken,
        child: FigmaDesignFile(
          fileId: figmaFileId,
          child: ListView(
            children: <Widget>[
              FigmaDesignNode.node(
                name: figmaNode1,
              ),
              SizedBox(
                height: 478,
                child: FigmaDesignNode.component(
                  name: figmaComponentName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
