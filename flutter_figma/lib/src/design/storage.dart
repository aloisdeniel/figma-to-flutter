import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

abstract class FigmaDesignStorage {
  const FigmaDesignStorage();
  Future<bool> exists(String fileId);
  Future<Map<String, dynamic>> load(String fileId);
  Future<void> save(String fileId, Map<String, dynamic> json);
}

class FileFigmaDesignStorage extends FigmaDesignStorage {
  final String directoryName;

  const FileFigmaDesignStorage({
    this.directoryName = '.flutter_figma',
  });

  Future<File> _cacheFile(String fileId) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final directory = Directory(path.join(appDocDir.path, directoryName));
    return File(path.join(directory.path, fileId));
  }

  @override
  Future<Map<String, dynamic>> load(String fileId) async {
    final localFile = await _cacheFile(fileId);

    if (await localFile.exists()) {
      final content = await localFile.readAsString();
      return jsonDecode(content);
    }

    return null;
  }

  @override
  Future<void> save(String fileId, Map<String, dynamic> json) async {
    if (json != null) {
      final localFile = await _cacheFile(fileId);

      final parent = Directory(path.dirname(localFile.path));

      if (!await parent.exists()) {
        await parent.create();
      }

      await localFile.writeAsString(jsonEncode(json));
    }
  }

  @override
  Future<bool> exists(String fileId) async {
    final localFile = await _cacheFile(fileId);
    return await localFile.exists();
  }
}
