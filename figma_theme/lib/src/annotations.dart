import 'package:meta/meta.dart';

class FigmaTheme {
  final String apiToken;
  final String fileKey;
  final int version;
  const FigmaTheme(
    this.version, {
    @required this.apiToken,
    @required this.fileKey,
  });
}
