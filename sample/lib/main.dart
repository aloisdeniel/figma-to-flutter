import 'package:flutter/material.dart';
import 'widgets/sample.g.dart';

void main() => runApp(new MyApp());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Todo {
  bool isSelected = false;
  final String title;
  Todo(this.title);
  void toggle() => this.isSelected = !this.isSelected;
}

class _HomeState extends State<Home> {

  List<Todo> todos = [
    Todo("a first example"),
    Todo("a second one"),
    Todo("an another"),
  ];

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (b,i) => Container(
          margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            constraints: BoxConstraints.expand(height: 48.0),  
            child: TodoItem(
              data: TodoItemData(
                title:  TextData(text: todos[i].title),
                selected: VectorData(isVisible: todos[i].isSelected),
              ),
              onSelect: (){ 
                print("selected"); 
                this.setState(() => todos[i].toggle());
              }),
      ),
         
    ));
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