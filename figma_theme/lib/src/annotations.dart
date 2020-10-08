import 'package:meta/meta.dart';

class FigmaTheme {
  final String apiToken;
  final String fileKey;
  final int version;

  /// Used as asset package (fontFamily, icon, ...)
  final String package;
  const FigmaTheme(
    this.version, {
    @required this.apiToken,
    @required this.fileKey,
    this.package,
  });
}
