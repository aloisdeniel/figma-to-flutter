class FigmaFile {
  final String key;
  const FigmaFile(this.key);
}

class FigmaComponent {
  final String name;
  final String generatedName;
  const FigmaComponent(this.name, {this.generatedName = null});
}