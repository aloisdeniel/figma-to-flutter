import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_figma_sample/cards/cards.g.dart';

class CardsPage extends StatelessWidget {

  Widget _buildCard(BuildContext constext, int i) => Container(
    margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
    constraints: BoxConstraints.expand(height: 128.0),  
    child: Card1(
      title:  TextData(text: "Test $i"),
      loveCount: TextData(text: min(i * 3 * 10 + i, 99).toString()),
      imageProvider: NetworkImage("https://picsum.photos/801?image=${i * 5}"),
    )
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildCard,
      itemCount: 20,
    );
  }
}

class Sample {
  final String name;
  final WidgetBuilder builder;
  Sample(this.name, this.builder);
}