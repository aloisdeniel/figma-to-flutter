import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class FigmaApiGenerator {
  final String authToken;
  final BaseClient http;

  FigmaApiGenerator(this.http, this.authToken);

  Future<dynamic> getFile(String fileKey) async {
    var response = await http.get(
        "https://api.figma.com/v1/files/$fileKey?geometry=paths",
        headers: {
          "X-FIGMA-TOKEN": this.authToken,
        });
    return json.decode(response.body);
  }
}
