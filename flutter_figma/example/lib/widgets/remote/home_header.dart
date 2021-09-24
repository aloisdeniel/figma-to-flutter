import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../local/home_header.dart' as local;

class HomeHeader extends local.HomeHeader {
  const HomeHeader({
    Key? key,
    String welcome = 'Welcome',
    required String name,
  }) : super(
          key: key,
          name: name,
          welcome: welcome,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: RemoteFigmaComponent(
        componentName: 'HomeHeader',
        data: RemoteFigmaData(
          text: {
            'name': name,
            'welcome': welcome,
          },
        ),
      ),
    );
  }
}
