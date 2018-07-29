import 'package:flutter/material.dart';
import 'widgets/sample.g.dart';

void main() => runApp(new MyApp());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _i = 0;

  Widget _createWidget() {
    switch(_i) {
      case 0: return Logo();
      case 1: return TodoItem();
      default:
        _i  = 0;
        return _createWidget(); 
    }
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Container(
            constraints: BoxConstraints.expand(),  
            child: _createWidget(),
      ),
          floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.skip_next),
            onPressed: (){
              this.setState((){
                _i++;
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