import 'package:flutter/material.dart';
import 'package:flutter_figma_sample/gallery/gallery.g.dart';

class GalleryPage extends StatelessWidget {

  final samples = [
    Sample("Logo", (b) => Logo()),
    Sample("Constraints1", (b) => Constraints1()),
    Sample("ConstraintsNested", (b) => ConstraintsNested()),
    Sample("LandscapeSimple", (b) => LandscapeSimple()),
    Sample("LandscapeEffects", (b) => LandscapeEffects()),
    Sample("Goups", (b) => Goups()),
    Sample("Frames", (b) => Frames()),
    Sample("Goups2", (b) => Goups2()),
    Sample("MultiGoups", (b) => MultiGoups()),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (b,i) => Column(
              children:[ 
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Text(samples[i].name),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  constraints: BoxConstraints.expand(height: 300.0),  
                  child: samples[i].builder(b)
                ),
        ]
      ),
      itemCount: samples.length,
    );
  }
}

class Sample {
  final String name;
  final WidgetBuilder builder;
  Sample(this.name, this.builder);
}