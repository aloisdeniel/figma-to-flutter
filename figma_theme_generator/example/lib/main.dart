import 'package:example/theme.dart';
import 'package:flutter/material.dart';
export 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ExampleTheme(
      data: ExampleThemeData.fallback(),
      child: MaterialApp(
        title: 'Figma Theme',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: GalleryPage(),
      ),
    );
  }
}

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exampleTheme = ExampleTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Figma Theme'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Title',
                style: exampleTheme.text.title,
              ),
              const Space(),
              Text(
                'Subtitle',
                style: exampleTheme.text.subtitle,
              ),
              const Space(),
              Text(
                'Paragraph',
                style: exampleTheme.text.paragraph,
              ),
              const Space(),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ColorExample(
                    color: exampleTheme.colors.red,
                  ),
                  ColorExample(
                    color: exampleTheme.colors.blue,
                  ),
                  ColorExample(
                    color: exampleTheme.colors.green,
                  ),
                  ColorExample(
                    color: exampleTheme.colors.black,
                  ),
                ],
              ),
              const Space(),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  GradientExample(
                    gradient: exampleTheme.gradients.gradient,
                  ),
                ],
              ),
              const Space(),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ShadowExample(
                    shadow: exampleTheme.shadows.drop,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Space extends StatelessWidget {
  const Space();
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 16);
  }
}

class ColorExample extends StatelessWidget {
  final Color color;
  const ColorExample({
    Key key,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

class GradientExample extends StatelessWidget {
  final Gradient gradient;
  const GradientExample({
    Key key,
    @required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

class ShadowExample extends StatelessWidget {
  final BoxShadow shadow;
  const ShadowExample({
    Key key,
    @required this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [shadow],
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
