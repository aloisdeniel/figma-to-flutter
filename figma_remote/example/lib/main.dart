import 'package:figma_remote/figma_remote.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RemoteFigma(
      token: '239258-424aeb15-66f3-4a5c-9121-08fdc6537a33',
      fileId: 'FMUAbSfit7nA1Qf4OFIccK',
      child: MaterialApp(
        title: 'Figma Remote',
        home: Center(
          child: RemoteFigmaComponent(
            componentName: 'Label',
          ),
        ),
      ),
    );
  }
}
