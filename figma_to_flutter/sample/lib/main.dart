

import 'package:flutter/material.dart';
import 'package:flutter_figma_sample/cards/cards.dart';
import 'package:flutter_figma_sample/gallery/gallery.dart';
import 'package:flutter_figma_sample/logo.g.dart';
import 'package:flutter_figma_sample/todo/todo.dart';
import 'package:flutter_figma_sample/todo/todo.g.dart';

void main() => runApp(new MyApp());

var appBarColor = Color(0xFF343841);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Figma to Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  final samples = [
    Sample("Todo", (b) => TodoPage()),
    Sample("Gallery", (b) => GalleryPage()),
    Sample("Cards", (b) => CardsPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: appBarColor,
              title: Container(
                constraints: BoxConstraints.expand(height: 40.80, width: 28.10),  
                child: Logo(),
              )
            ),
            body:ListView.builder(itemBuilder:(b,i) => SampleCell(samples[i]), itemCount: samples.length)
    );
  }
}

class Sample {
  final String name;
  final WidgetBuilder builder;
  Sample(this.name, this.builder);
}

class SampleCell  extends StatelessWidget {
  final Sample sample;
  SampleCell(this.sample);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (b) => Scaffold(
            appBar: AppBar(
              backgroundColor: appBarColor,
              title: Text(this.sample.name),
            ),
            body: this.sample.builder(b)
          ),
      ));
    },
    child:Card(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Text(this.sample.name), 
      )
    )
  );
  }
}

/**
 home: Stack(children: <Widget>[
         TodoPage(),
         Align(
          alignment: Alignment.topLeft,
            child:
             Container(
               constraints: BoxConstraints.expand(
               width: 50.0,
               height: 100.0,),
             child:Transform.translate(
               child: Text("X"),
               offset: Offset(0.0,0.0),
             ))
         )
         
      ]),
 */