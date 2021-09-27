import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/layouts/home/layout.dart';
import 'package:flutter_figma_app/library_loader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditorApp extends StatelessWidget {
  const EditorApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: LibraryLoader(
        child: MaterialApp(
          home: HomeLayout(),
        ),
      ),
    );
  }
}
