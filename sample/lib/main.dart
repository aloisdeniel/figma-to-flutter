

import 'package:flutter/material.dart';
import 'package:flutter_figma_sample/todo/todo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Figma to Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
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
    );
  }
}