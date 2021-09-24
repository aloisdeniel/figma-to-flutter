import 'package:flutter/widgets.dart';

class Variants extends StatelessWidget {
  const Variants({
    Key? key,
    required this.variants,
    required this.definitions,
  }) : super(key: key);

  final Map<String, String> variants;
  final List<VariantDefinition> definitions;

  @override
  Widget build(BuildContext context) {
    final definition = definitions.firstWhere(
      (x) => x.properties.entries.every((x) => variants[x.key] == x.value),
      orElse: () => definitions.first,
    );
    return definition;
  }
}

class VariantDefinition extends StatelessWidget {
  const VariantDefinition({
    Key? key,
    required this.properties,
    required this.child,
  }) : super(key: key);

  final Map<String, String> properties;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
