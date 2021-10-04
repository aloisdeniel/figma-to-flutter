import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';

abstract class SpotCard extends StatelessWidget {
  const SpotCard({Key? key}) : super(key: key);

  const factory SpotCard.modeGood(
      {Key? key,
      SpotCardModeGoodData data,
      SpotCardModeGoodThemeData theme}) = SpotCardModeGood;

  const factory SpotCard.modeBad(
      {Key? key,
      SpotCardModeBadData data,
      SpotCardModeBadThemeData theme}) = SpotCardModeBad;
}

class SpotCardModeGood extends SpotCard {
  const SpotCardModeGood(
      {Key? key, this.data = const SpotCardModeGoodData(), this.theme})
      : super(key: key);

  final SpotCardModeGoodThemeData? theme;

  final SpotCardModeGoodData data;

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? SpotCardModeGoodTheme.of(context);
    return Container(
      decoration: ShapeDecoration(
        color: theme.color.modeGood2,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius.only(
            topLeft: SmoothRadius(
              cornerRadius: 12.0,
              cornerSmoothing: 0.0,
            ),
            topRight: SmoothRadius(
              cornerRadius: 12.0,
              cornerSmoothing: 0.0,
            ),
            bottomLeft: SmoothRadius(
              cornerRadius: 12.0,
              cornerSmoothing: 0.0,
            ),
            bottomRight: SmoothRadius(
              cornerRadius: 12.0,
              cornerSmoothing: 0.0,
            ),
          ),
          borderAlign: BorderAlign.inside,
        ),
      ),
      child: Container(
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.only(
              topLeft: SmoothRadius(
                cornerRadius: 12.0,
                cornerSmoothing: 0.0,
              ),
              topRight: SmoothRadius(
                cornerRadius: 12.0,
                cornerSmoothing: 0.0,
              ),
              bottomLeft: SmoothRadius(
                cornerRadius: 12.0,
                cornerSmoothing: 0.0,
              ),
              bottomRight: SmoothRadius(
                cornerRadius: 12.0,
                cornerSmoothing: 0.0,
              ),
            ),
            borderAlign: BorderAlign.inside,
          ),
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              start: theme.spacing.frame1,
              end: theme.spacing.frame11,
              top: theme.spacing.frame12,
              child: SizedBox(
                height: 93.0,
                child: SizedBox(
                  width: 276.0,
                  height: 93.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        data.text.name,
                      ),
                      SizedBox(
                        height: theme.spacing.frame1SpaceBetween1,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 20.0,
                        child: SizedBox(
                          width: 276.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 14.0,
                                height: 14.0,
                                child: IconCheckCircleStateSelected(),
                              ),
                              SizedBox(
                                width: theme.spacing.frame1SpaceBetween,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    data.text.description,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: theme.spacing.frame1SpaceBetween1,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 28.0,
                        child: SpotIndicators(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              start: theme.spacing.verticalBarIndicator,
              top: theme.spacing.verticalBarIndicator1,
              bottom: theme.spacing.verticalBarIndicator2,
              child: SizedBox(
                width: 8.0,
                child: Container(
                  decoration: ShapeDecoration(
                    color: theme.color.verticalBarIndicator1,
                    shape: SmoothRectangleBorder(
                      side: BorderSide(
                        color: theme.color.verticalBarIndicator,
                        width: 6.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: SmoothBorderRadius.only(
                        topLeft: SmoothRadius(
                          cornerRadius: 35.0,
                          cornerSmoothing: 0.0,
                        ),
                        topRight: SmoothRadius(
                          cornerRadius: 35.0,
                          cornerSmoothing: 0.0,
                        ),
                        bottomLeft: SmoothRadius(
                          cornerRadius: 35.0,
                          cornerSmoothing: 0.0,
                        ),
                        bottomRight: SmoothRadius(
                          cornerRadius: 35.0,
                          cornerSmoothing: 0.0,
                        ),
                      ),
                      borderAlign: BorderAlign.outside,
                    ),
                  ),
                  child: Stack(
                    children: [
                      PositionedDirectional(
                        start: theme.spacing.valueBar,
                        end: theme.spacing.valueBar1,
                        top: theme.spacing.valueBar2,
                        bottom: theme.spacing.valueBar3,
                        child: Container(
                          decoration: ShapeDecoration(
                            color: theme.color.valueBar,
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius.only(
                                topLeft: SmoothRadius(
                                  cornerRadius: 35.0,
                                  cornerSmoothing: 0.0,
                                ),
                                topRight: SmoothRadius(
                                  cornerRadius: 35.0,
                                  cornerSmoothing: 0.0,
                                ),
                                bottomLeft: SmoothRadius(
                                  cornerRadius: 35.0,
                                  cornerSmoothing: 0.0,
                                ),
                                bottomRight: SmoothRadius(
                                  cornerRadius: 35.0,
                                  cornerSmoothing: 0.0,
                                ),
                              ),
                              borderAlign: BorderAlign.inside,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpotCardModeGoodData {
  const SpotCardModeGoodData({this.text = const SpotCardModeGoodTextData()});

  final SpotCardModeGoodTextData text;
}

class SpotCardModeGoodTextData {
  const SpotCardModeGoodTextData(
      {this.name = 'Saint-Lunaire',
      this.description = '85% de conditions positives',
      this.d15m = '1.5m',
      this.d2503s = '2503s'});

  final String name;

  final String description;

  final String d15m;

  final String d2503s;
}

class SpotCardModeGoodTheme extends InheritedWidget {
  const SpotCardModeGoodTheme(
      {Key? key, required this.data, required Widget child})
      : super(
          key: key,
          child: child,
        );

  final SpotCardModeGoodThemeData data;

  static SpotCardModeGoodThemeData of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<SpotCardModeGoodTheme>()
            ?.data ??
        const SpotCardModeGoodThemeData();
  }

  bool updateShouldNotify(covariant SpotCardModeGoodTheme oldWidget) {
    return data != oldWidget.data;
  }
}

class SpotCardModeGoodThemeData {
  const SpotCardModeGoodThemeData(
      {this.color = const SpotCardModeGoodThemeColorData(),
      this.spacing = const SpotCardModeGoodThemeSpacingData()});

  final SpotCardModeGoodThemeColorData color;

  final SpotCardModeGoodThemeSpacingData spacing;
}

class SpotCardModeGoodThemeColorData {
  const SpotCardModeGoodThemeColorData(
      {this.shape = const Color(0xff39a894),
      this.shape1 = const Color(0xffffffff),
      this.spotIndicator = const Color(0xff36325f),
      this.shape2 = const Color(0xff363360),
      this.spotIndicator1 = const Color(0xffffffff),
      this.valueBar = const Color(0xff4fd1b9),
      this.verticalBarIndicator = const Color(0xffffffff),
      this.verticalBarIndicator1 = const Color(0xffbae6e5),
      this.modeGood = const Color(0x2d4fd1ba),
      this.modeGood1 = const Color(0x4fd1ba),
      this.modeGood2 = const Color(0xfff8f9ff)});

  final Color shape;

  final Color shape1;

  final Color spotIndicator;

  final Color shape2;

  final Color spotIndicator1;

  final Color valueBar;

  final Color verticalBarIndicator;

  final Color verticalBarIndicator1;

  final Color modeGood;

  final Color modeGood1;

  final Color modeGood2;
}

class SpotCardModeGoodThemeSpacingData {
  const SpotCardModeGoodThemeSpacingData(
      {this.shape = 1.17,
      this.shape1 = 1.17,
      this.shape2 = 1.17,
      this.shape3 = 1.17,
      this.checkmarkCircle = 0.0,
      this.checkmarkCircle1 = 0.0,
      this.checkmarkCircle2 = 0.0,
      this.checkmarkCircle3 = 0.0,
      this.frame1SpaceBetween = 4.0,
      this.shape4 = 1.0,
      this.shape5 = 1.0,
      this.shape6 = 1.0,
      this.shape7 = 1.0,
      this.stream = 0.0,
      this.stream1 = 0.0,
      this.stream2 = 0.0,
      this.stream3 = 0.0,
      this.spotIndicatorSpaceBetween = 4.0,
      this.spotIndicator = 12.0,
      this.spotIndicator1 = 4.0,
      this.spotIndicator2 = 12.0,
      this.spotIndicator3 = 4.0,
      this.shape8 = 1.0,
      this.shape9 = 1.0,
      this.shape10 = 1.0,
      this.shape11 = 1.0,
      this.stream4 = 0.0,
      this.stream5 = 0.0,
      this.stream6 = 0.0,
      this.stream7 = 0.0,
      this.spotIndicatorSpaceBetween1 = 4.0,
      this.spotIndicator4 = 12.0,
      this.spotIndicator5 = 4.0,
      this.spotIndicator6 = 12.0,
      this.spotIndicator7 = 4.0,
      this.spotIndicatorsSpaceBetween = 4.0,
      this.frame1SpaceBetween1 = 4.0,
      this.frame1 = 27.0,
      this.frame11 = 12.0,
      this.frame12 = 9.0,
      this.valueBar = 0.0,
      this.valueBar1 = 0.0,
      this.valueBar2 = 20.0,
      this.valueBar3 = 0.0,
      this.verticalBarIndicator = -3.0,
      this.verticalBarIndicator1 = 15.0,
      this.verticalBarIndicator2 = 16.0});

  final double shape;

  final double shape1;

  final double shape2;

  final double shape3;

  final double checkmarkCircle;

  final double checkmarkCircle1;

  final double checkmarkCircle2;

  final double checkmarkCircle3;

  final double frame1SpaceBetween;

  final double shape4;

  final double shape5;

  final double shape6;

  final double shape7;

  final double stream;

  final double stream1;

  final double stream2;

  final double stream3;

  final double spotIndicatorSpaceBetween;

  final double spotIndicator;

  final double spotIndicator1;

  final double spotIndicator2;

  final double spotIndicator3;

  final double shape8;

  final double shape9;

  final double shape10;

  final double shape11;

  final double stream4;

  final double stream5;

  final double stream6;

  final double stream7;

  final double spotIndicatorSpaceBetween1;

  final double spotIndicator4;

  final double spotIndicator5;

  final double spotIndicator6;

  final double spotIndicator7;

  final double spotIndicatorsSpaceBetween;

  final double frame1SpaceBetween1;

  final double frame1;

  final double frame11;

  final double frame12;

  final double valueBar;

  final double valueBar1;

  final double valueBar2;

  final double valueBar3;

  final double verticalBarIndicator;

  final double verticalBarIndicator1;

  final double verticalBarIndicator2;
}

class SpotCardModeBad extends SpotCard {
  const SpotCardModeBad(
      {Key? key, this.data = const SpotCardModeBadData(), this.theme})
      : super(key: key);

  final SpotCardModeBadThemeData? theme;

  final SpotCardModeBadData data;

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? SpotCardModeBadTheme.of(context);
    return Container(
      decoration: ShapeDecoration(
        color: theme.color.modeBad2,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius.only(
            topLeft: SmoothRadius(
              cornerRadius: 12.0,
              cornerSmoothing: 0.0,
            ),
            topRight: SmoothRadius(
              cornerRadius: 12.0,
              cornerSmoothing: 0.0,
            ),
            bottomLeft: SmoothRadius(
              cornerRadius: 12.0,
              cornerSmoothing: 0.0,
            ),
            bottomRight: SmoothRadius(
              cornerRadius: 12.0,
              cornerSmoothing: 0.0,
            ),
          ),
          borderAlign: BorderAlign.inside,
        ),
      ),
      child: Container(
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.only(
              topLeft: SmoothRadius(
                cornerRadius: 12.0,
                cornerSmoothing: 0.0,
              ),
              topRight: SmoothRadius(
                cornerRadius: 12.0,
                cornerSmoothing: 0.0,
              ),
              bottomLeft: SmoothRadius(
                cornerRadius: 12.0,
                cornerSmoothing: 0.0,
              ),
              bottomRight: SmoothRadius(
                cornerRadius: 12.0,
                cornerSmoothing: 0.0,
              ),
            ),
            borderAlign: BorderAlign.inside,
          ),
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              start: theme.spacing.frame1,
              end: theme.spacing.frame11,
              top: theme.spacing.frame12,
              child: SizedBox(
                height: 93.0,
                child: SizedBox(
                  width: 276.0,
                  height: 93.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        data.text.name,
                      ),
                      SizedBox(
                        height: theme.spacing.frame1SpaceBetween1,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 20.0,
                        child: SizedBox(
                          width: 276.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 14.0,
                                height: 14.0,
                                child: IconCheckCircleStateSelected(),
                              ),
                              SizedBox(
                                width: theme.spacing.frame1SpaceBetween,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    data.text.description,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: theme.spacing.frame1SpaceBetween1,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 28.0,
                        child: SpotIndicators(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              start: theme.spacing.verticalBarIndicator,
              top: theme.spacing.verticalBarIndicator1,
              bottom: theme.spacing.verticalBarIndicator2,
              child: SizedBox(
                width: 8.0,
                child: Container(
                  decoration: ShapeDecoration(
                    color: theme.color.verticalBarIndicator1,
                    shape: SmoothRectangleBorder(
                      side: BorderSide(
                        color: theme.color.verticalBarIndicator,
                        width: 6.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: SmoothBorderRadius.only(
                        topLeft: SmoothRadius(
                          cornerRadius: 35.0,
                          cornerSmoothing: 0.0,
                        ),
                        topRight: SmoothRadius(
                          cornerRadius: 35.0,
                          cornerSmoothing: 0.0,
                        ),
                        bottomLeft: SmoothRadius(
                          cornerRadius: 35.0,
                          cornerSmoothing: 0.0,
                        ),
                        bottomRight: SmoothRadius(
                          cornerRadius: 35.0,
                          cornerSmoothing: 0.0,
                        ),
                      ),
                      borderAlign: BorderAlign.outside,
                    ),
                  ),
                  child: Stack(
                    children: [
                      PositionedDirectional(
                        start: theme.spacing.rectangle2,
                        end: theme.spacing.rectangle21,
                        top: theme.spacing.rectangle22,
                        bottom: theme.spacing.rectangle23,
                        child: Container(
                          decoration: ShapeDecoration(
                            color: theme.color.rectangle2,
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius.only(
                                topLeft: SmoothRadius(
                                  cornerRadius: 35.0,
                                  cornerSmoothing: 0.0,
                                ),
                                topRight: SmoothRadius(
                                  cornerRadius: 35.0,
                                  cornerSmoothing: 0.0,
                                ),
                                bottomLeft: SmoothRadius(
                                  cornerRadius: 35.0,
                                  cornerSmoothing: 0.0,
                                ),
                                bottomRight: SmoothRadius(
                                  cornerRadius: 35.0,
                                  cornerSmoothing: 0.0,
                                ),
                              ),
                              borderAlign: BorderAlign.inside,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpotCardModeBadData {
  const SpotCardModeBadData({this.text = const SpotCardModeBadTextData()});

  final SpotCardModeBadTextData text;
}

class SpotCardModeBadTextData {
  const SpotCardModeBadTextData(
      {this.name = 'Saint-Lunaire',
      this.description = '85% de conditions positives',
      this.d15m = '1.5m',
      this.d2503s = '2503s'});

  final String name;

  final String description;

  final String d15m;

  final String d2503s;
}

class SpotCardModeBadTheme extends InheritedWidget {
  const SpotCardModeBadTheme(
      {Key? key, required this.data, required Widget child})
      : super(
          key: key,
          child: child,
        );

  final SpotCardModeBadThemeData data;

  static SpotCardModeBadThemeData of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<SpotCardModeBadTheme>()
            ?.data ??
        const SpotCardModeBadThemeData();
  }

  bool updateShouldNotify(covariant SpotCardModeBadTheme oldWidget) {
    return data != oldWidget.data;
  }
}

class SpotCardModeBadThemeData {
  const SpotCardModeBadThemeData(
      {this.color = const SpotCardModeBadThemeColorData(),
      this.spacing = const SpotCardModeBadThemeSpacingData()});

  final SpotCardModeBadThemeColorData color;

  final SpotCardModeBadThemeSpacingData spacing;
}

class SpotCardModeBadThemeColorData {
  const SpotCardModeBadThemeColorData(
      {this.shape = const Color(0xffe8687f),
      this.shape1 = const Color(0xffffffff),
      this.spotIndicator = const Color(0xff36325f),
      this.shape2 = const Color(0xff363360),
      this.spotIndicator1 = const Color(0xffffffff),
      this.rectangle2 = const Color(0xffe8687f),
      this.verticalBarIndicator = const Color(0xffffffff),
      this.verticalBarIndicator1 = const Color(0xffeedee9),
      this.modeBad = const Color(0x21e96980),
      this.modeBad1 = const Color(0xe96980),
      this.modeBad2 = const Color(0xfff8f9ff)});

  final Color shape;

  final Color shape1;

  final Color spotIndicator;

  final Color shape2;

  final Color spotIndicator1;

  final Color rectangle2;

  final Color verticalBarIndicator;

  final Color verticalBarIndicator1;

  final Color modeBad;

  final Color modeBad1;

  final Color modeBad2;
}

class SpotCardModeBadThemeSpacingData {
  const SpotCardModeBadThemeSpacingData(
      {this.shape = 1.17,
      this.shape1 = 1.17,
      this.shape2 = 1.17,
      this.shape3 = 1.17,
      this.checkmarkCircle = 0.0,
      this.checkmarkCircle1 = 0.0,
      this.checkmarkCircle2 = 0.0,
      this.checkmarkCircle3 = 0.0,
      this.frame1SpaceBetween = 4.0,
      this.shape4 = 1.0,
      this.shape5 = 1.0,
      this.shape6 = 1.0,
      this.shape7 = 1.0,
      this.stream = 0.0,
      this.stream1 = 0.0,
      this.stream2 = 0.0,
      this.stream3 = 0.0,
      this.spotIndicatorSpaceBetween = 4.0,
      this.spotIndicator = 12.0,
      this.spotIndicator1 = 4.0,
      this.spotIndicator2 = 12.0,
      this.spotIndicator3 = 4.0,
      this.shape8 = 1.0,
      this.shape9 = 1.0,
      this.shape10 = 1.0,
      this.shape11 = 1.0,
      this.stream4 = 0.0,
      this.stream5 = 0.0,
      this.stream6 = 0.0,
      this.stream7 = 0.0,
      this.spotIndicatorSpaceBetween1 = 4.0,
      this.spotIndicator4 = 12.0,
      this.spotIndicator5 = 4.0,
      this.spotIndicator6 = 12.0,
      this.spotIndicator7 = 4.0,
      this.spotIndicatorsSpaceBetween = 4.0,
      this.frame1SpaceBetween1 = 4.0,
      this.frame1 = 27.0,
      this.frame11 = 12.0,
      this.frame12 = 9.0,
      this.rectangle2 = 0.0,
      this.rectangle21 = 0.0,
      this.rectangle22 = 20.0,
      this.rectangle23 = 0.0,
      this.verticalBarIndicator = -3.0,
      this.verticalBarIndicator1 = 15.0,
      this.verticalBarIndicator2 = 16.0});

  final double shape;

  final double shape1;

  final double shape2;

  final double shape3;

  final double checkmarkCircle;

  final double checkmarkCircle1;

  final double checkmarkCircle2;

  final double checkmarkCircle3;

  final double frame1SpaceBetween;

  final double shape4;

  final double shape5;

  final double shape6;

  final double shape7;

  final double stream;

  final double stream1;

  final double stream2;

  final double stream3;

  final double spotIndicatorSpaceBetween;

  final double spotIndicator;

  final double spotIndicator1;

  final double spotIndicator2;

  final double spotIndicator3;

  final double shape8;

  final double shape9;

  final double shape10;

  final double shape11;

  final double stream4;

  final double stream5;

  final double stream6;

  final double stream7;

  final double spotIndicatorSpaceBetween1;

  final double spotIndicator4;

  final double spotIndicator5;

  final double spotIndicator6;

  final double spotIndicator7;

  final double spotIndicatorsSpaceBetween;

  final double frame1SpaceBetween1;

  final double frame1;

  final double frame11;

  final double frame12;

  final double rectangle2;

  final double rectangle21;

  final double rectangle22;

  final double rectangle23;

  final double verticalBarIndicator;

  final double verticalBarIndicator1;

  final double verticalBarIndicator2;
}
