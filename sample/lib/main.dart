import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'widgets/sample.g.dart';

void main() => runApp(new MyApp());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _i = 0;
  CustomPainter painter;

  CustomPainter _createPainter() {
    _i++;
    switch(_i) {
      case 1: return LogoPainter();
      default:
        _i  = 0;
        return _createPainter(); 
    }
  }

  @override
    void initState() {
      super.initState();
      painter = _createPainter();
    }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Container(
            constraints: BoxConstraints.expand(),  
            child: CustomPaint(
              painter: painter,
            ),
      ),
          floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.skip_next),
            onPressed: (){
              this.setState((){
                painter = _createPainter();
              });
            }
          ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(),
    );
  }
}