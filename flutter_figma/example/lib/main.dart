import 'package:example/widgets/base/indicator.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedTab = 0;
  late final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RemoteFigma.fromAsset(
      child: MaterialApp(
        title: 'Demo',
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Builder(builder: (context) {
            final mediaQuery = MediaQuery.of(context);
            return Stack(
              children: [
                PageView(
                  controller: controller,
                  children: [
                    ListView(
                      padding: mediaQuery.padding.copyWith(top: 0) +
                          const EdgeInsets.only(bottom: 60),
                      children: [
                        const HomeHeader(
                          name: 'Brice',
                        ),
                        ...const <Widget>[
                          SpotTile(
                            name: 'Saint-Lunaire',
                            positive: 0.75,
                            onTap: none,
                            positiveIndicators: {
                              ConditionIndicator.waveHeight: '0.9m',
                              ConditionIndicator.wavePeriod: '5s',
                              ConditionIndicator.distance: '36km',
                            },
                            negativeIndicators: {
                              ConditionIndicator.waterTemperature: '15°',
                              ConditionIndicator.airTemperature: '19°',
                            },
                          ),
                          SpotTile(
                            name: 'Fort-Bloqué',
                            positive: 0.85,
                            onTap: none,
                            positiveIndicators: {
                              ConditionIndicator.waveHeight: '1.0m',
                              ConditionIndicator.wavePeriod: '6s',
                              ConditionIndicator.waterTemperature: '20°',
                            },
                            negativeIndicators: {
                              ConditionIndicator.distance: '206km',
                              ConditionIndicator.airTemperature: '25°',
                            },
                          ),
                          SpotTile(
                            name: 'Hendaye',
                            positive: 0.95,
                            onTap: none,
                            positiveIndicators: {
                              ConditionIndicator.waveHeight: '1.5m',
                              ConditionIndicator.wavePeriod: '4s',
                              ConditionIndicator.waterTemperature: '18°',
                              ConditionIndicator.airTemperature: '32°',
                            },
                            negativeIndicators: {
                              ConditionIndicator.distance: '800km',
                            },
                          ),
                          SpotTile(
                            name: 'La Torche',
                            onTap: none,
                            positiveIndicators: {
                              ConditionIndicator.waveHeight: '1.5m',
                              ConditionIndicator.wavePeriod: '4s',
                              ConditionIndicator.waterTemperature: '18°',
                            },
                            negativeIndicators: {
                              ConditionIndicator.distance: '15km',
                              ConditionIndicator.airTemperature: '26°',
                            },
                            positive: 0.5,
                          ),
                          SpotTile(
                            name: 'Saint-Malo',
                            positive: 0.25,
                            onTap: none,
                            positiveIndicators: {
                              ConditionIndicator.waveHeight: '1.5m',
                              ConditionIndicator.wavePeriod: '4s',
                              ConditionIndicator.waterTemperature: '18°',
                            },
                            negativeIndicators: {
                              ConditionIndicator.distance: '15km',
                              ConditionIndicator.airTemperature: '26°',
                            },
                          ),
                        ].map((child) => Padding(
                              padding:
                                  const EdgeInsets.all(20).copyWith(bottom: 0),
                              child: child,
                            ))
                      ],
                    ),
                    const SizedBox(),
                    const SizedBox(),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Tabbar(
                    selectedTab: selectedTab,
                    onSelectedTabChanged: (i) {
                      setState(() {
                        selectedTab = i;
                      });
                      controller.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

none() {
  print('tap');
}
