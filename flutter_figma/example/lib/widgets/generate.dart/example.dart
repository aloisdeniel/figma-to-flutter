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
                                child: ComponentRenderer(
                                  child: Stack(
                                    children: [
                                      PositionedDirectional(
                                        start: theme.spacing.checkmarkCircle,
                                        end: theme.spacing.checkmarkCircle1,
                                        top: theme.spacing.checkmarkCircle2,
                                        bottom: theme.spacing.checkmarkCircle3,
                                        child: SizedBox(
                                          width: 14.0,
                                          height: 14.0,
                                          child: Stack(
                                            children: [
                                              PositionedDirectional(
                                                start: theme.spacing.shape,
                                                end: theme.spacing.shape1,
                                                top: theme.spacing.shape2,
                                                bottom: theme.spacing.shape3,
                                                child: SizedBox(
                                                  width: 11.67,
                                                  height: 11.67,
                                                  child: PathView(
                                                    geometry: [
                                                      const Geometry(
                                                        'M5.83333 0C9.055 0 11.6667 2.61167 11.6667 5.83333C11.6667 9.055 9.055 11.6667 5.83333 11.6667C2.61167 11.6667 0 9.055 0 5.83333C0 2.61167 2.61167 0 5.83333 0ZM7.71147 4.06564L5.10417 6.67295L3.95519 5.52397C3.78434 5.35312 3.50733 5.35312 3.33647 5.52397C3.16562 5.69483 3.16562 5.97184 3.33647 6.14269L4.79481 7.60103C4.96566 7.77188 5.24267 7.77188 5.41353 7.60103L8.33019 4.68436C8.50105 4.5135 8.50105 4.2365 8.33019 4.06564C8.15934 3.89479 7.88233 3.89479 7.71147 4.06564Z',
                                                        windingRule: 'NONZERO',
                                                      ),
                                                    ],
                                                    fills: [
                                                      ShapeDecoration(
                                                        color:
                                                            theme.color.shape,
                                                        shape:
                                                            SmoothRectangleBorder(
                                                          borderRadius:
                                                              SmoothBorderRadius
                                                                  .zero,
                                                          borderAlign:
                                                              BorderAlign
                                                                  .inside,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                        child: ComponentRenderer(
                          child: SizedBox(
                            width: 276.0,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 69.0,
                                  height: 28.0,
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: theme.color.spotIndicator,
                                      shape: SmoothRectangleBorder(
                                        borderRadius: SmoothBorderRadius.only(
                                          topLeft: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          topRight: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          bottomLeft: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          bottomRight: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                        ),
                                        borderAlign: BorderAlign.inside,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: theme.spacing.spotIndicator,
                                        top: theme.spacing.spotIndicator1,
                                        right: theme.spacing.spotIndicator2,
                                        bottom: theme.spacing.spotIndicator3,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 12.0,
                                            height: 12.0,
                                            child: ComponentRenderer(
                                              child: Stack(
                                                children: [
                                                  PositionedDirectional(
                                                    start: theme.spacing.stream,
                                                    end: theme.spacing.stream1,
                                                    top: theme.spacing.stream2,
                                                    bottom:
                                                        theme.spacing.stream3,
                                                    child: SizedBox(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      child: Stack(
                                                        children: [
                                                          PositionedDirectional(
                                                            start: theme
                                                                .spacing.shape4,
                                                            end: theme
                                                                .spacing.shape5,
                                                            top: theme
                                                                .spacing.shape6,
                                                            bottom: theme
                                                                .spacing.shape7,
                                                            child: SizedBox(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              child: PathView(
                                                                geometry: [
                                                                  const Geometry(
                                                                    'M3.5 4.5C3.5 2.42893 5.17893 0.75 7.25 0.75L7.29741 0.75C7.50452 0.75 7.67241 0.582107 7.67241 0.375C7.67241 0.167893 7.50452 0 7.29741 0L7.25 0C4.76472 0 2.75 2.01472 2.75 4.5L2.75 5.125C2.75 5.47018 2.47018 5.75 2.125 5.75L0.375 5.75C0.167893 5.75 0 5.91789 0 6.125C0 6.33211 0.167893 6.5 0.375 6.5L2.125 6.5C2.88439 6.5 3.5 5.88439 3.5 5.125L3.5 4.5ZM7.375 2.5C6.2014 2.5 5.25 3.4514 5.25 4.625L5.25 5.375C5.25 6.96282 3.96282 8.25 2.375 8.25L0.375 8.25C0.167893 8.25 0 8.08211 0 7.875C0 7.66789 0.167893 7.5 0.375 7.5L2.375 7.5C3.5486 7.5 4.5 6.5486 4.5 5.375L4.5 4.625C4.5 3.03718 5.78718 1.75 7.375 1.75L9.625 1.75C9.83211 1.75 10 1.91789 10 2.125C10 2.33211 9.83211 2.5 9.625 2.5L7.375 2.5ZM7.625 4.25C7.27982 4.25 7 4.52982 7 4.875L7 5.5C7 7.98528 4.98528 10 2.5 10L2.375 10C2.16789 10 2 9.83211 2 9.625C2 9.41789 2.16789 9.25 2.375 9.25L2.5 9.25C4.57107 9.25 6.25 7.57107 6.25 5.5L6.25 4.875C6.25 4.11561 6.86561 3.5 7.625 3.5L9.625 3.5C9.83211 3.5 10 3.66789 10 3.875C10 4.08211 9.83211 4.25 9.625 4.25L7.625 4.25Z',
                                                                    windingRule:
                                                                        'NONZERO',
                                                                  ),
                                                                ],
                                                                fills: [
                                                                  ShapeDecoration(
                                                                    color: theme
                                                                        .color
                                                                        .shape1,
                                                                    shape:
                                                                        SmoothRectangleBorder(
                                                                      borderRadius:
                                                                          SmoothBorderRadius
                                                                              .zero,
                                                                      borderAlign:
                                                                          BorderAlign
                                                                              .inside,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: theme.spacing
                                                .spotIndicatorSpaceBetween,
                                          ),
                                          SizedBox(
                                            width: 29.0,
                                            child: Text(
                                              data.text.d15m,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      theme.spacing.spotIndicatorsSpaceBetween,
                                ),
                                SizedBox(
                                  width: 79.0,
                                  height: 28.0,
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: theme.color.spotIndicator1,
                                      shape: SmoothRectangleBorder(
                                        borderRadius: SmoothBorderRadius.only(
                                          topLeft: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          topRight: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          bottomLeft: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          bottomRight: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                        ),
                                        borderAlign: BorderAlign.inside,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: theme.spacing.spotIndicator4,
                                        top: theme.spacing.spotIndicator5,
                                        right: theme.spacing.spotIndicator6,
                                        bottom: theme.spacing.spotIndicator7,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 12.0,
                                            height: 12.0,
                                            child: ComponentRenderer(
                                              child: Stack(
                                                children: [
                                                  PositionedDirectional(
                                                    start:
                                                        theme.spacing.stream4,
                                                    end: theme.spacing.stream5,
                                                    top: theme.spacing.stream6,
                                                    bottom:
                                                        theme.spacing.stream7,
                                                    child: SizedBox(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      child: Stack(
                                                        children: [
                                                          PositionedDirectional(
                                                            start: theme
                                                                .spacing.shape8,
                                                            end: theme
                                                                .spacing.shape9,
                                                            top: theme.spacing
                                                                .shape10,
                                                            bottom: theme
                                                                .spacing
                                                                .shape11,
                                                            child: SizedBox(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              child: PathView(
                                                                geometry: [
                                                                  const Geometry(
                                                                    'M3.5 4.5C3.5 2.42893 5.17893 0.75 7.25 0.75L7.29741 0.75C7.50452 0.75 7.67241 0.582107 7.67241 0.375C7.67241 0.167893 7.50452 0 7.29741 0L7.25 0C4.76472 0 2.75 2.01472 2.75 4.5L2.75 5.125C2.75 5.47018 2.47018 5.75 2.125 5.75L0.375 5.75C0.167893 5.75 0 5.91789 0 6.125C0 6.33211 0.167893 6.5 0.375 6.5L2.125 6.5C2.88439 6.5 3.5 5.88439 3.5 5.125L3.5 4.5ZM7.375 2.5C6.2014 2.5 5.25 3.4514 5.25 4.625L5.25 5.375C5.25 6.96282 3.96282 8.25 2.375 8.25L0.375 8.25C0.167893 8.25 0 8.08211 0 7.875C0 7.66789 0.167893 7.5 0.375 7.5L2.375 7.5C3.5486 7.5 4.5 6.5486 4.5 5.375L4.5 4.625C4.5 3.03718 5.78718 1.75 7.375 1.75L9.625 1.75C9.83211 1.75 10 1.91789 10 2.125C10 2.33211 9.83211 2.5 9.625 2.5L7.375 2.5ZM7.625 4.25C7.27982 4.25 7 4.52982 7 4.875L7 5.5C7 7.98528 4.98528 10 2.5 10L2.375 10C2.16789 10 2 9.83211 2 9.625C2 9.41789 2.16789 9.25 2.375 9.25L2.5 9.25C4.57107 9.25 6.25 7.57107 6.25 5.5L6.25 4.875C6.25 4.11561 6.86561 3.5 7.625 3.5L9.625 3.5C9.83211 3.5 10 3.66789 10 3.875C10 4.08211 9.83211 4.25 9.625 4.25L7.625 4.25Z',
                                                                    windingRule:
                                                                        'NONZERO',
                                                                  ),
                                                                ],
                                                                fills: [
                                                                  ShapeDecoration(
                                                                    color: theme
                                                                        .color
                                                                        .shape2,
                                                                    shape:
                                                                        SmoothRectangleBorder(
                                                                      borderRadius:
                                                                          SmoothBorderRadius
                                                                              .zero,
                                                                      borderAlign:
                                                                          BorderAlign
                                                                              .inside,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: theme.spacing
                                                .spotIndicatorSpaceBetween1,
                                          ),
                                          SizedBox(
                                            width: 39.0,
                                            child: Text(
                                              data.text.d2503s,
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
                        ),
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
                                child: ComponentRenderer(
                                  child: Stack(
                                    children: [
                                      PositionedDirectional(
                                        start: theme.spacing.checkmarkCircle,
                                        end: theme.spacing.checkmarkCircle1,
                                        top: theme.spacing.checkmarkCircle2,
                                        bottom: theme.spacing.checkmarkCircle3,
                                        child: SizedBox(
                                          width: 14.0,
                                          height: 14.0,
                                          child: Stack(
                                            children: [
                                              PositionedDirectional(
                                                start: theme.spacing.shape,
                                                end: theme.spacing.shape1,
                                                top: theme.spacing.shape2,
                                                bottom: theme.spacing.shape3,
                                                child: SizedBox(
                                                  width: 11.67,
                                                  height: 11.67,
                                                  child: PathView(
                                                    geometry: [
                                                      const Geometry(
                                                        'M5.83333 0C9.055 0 11.6667 2.61167 11.6667 5.83333C11.6667 9.055 9.055 11.6667 5.83333 11.6667C2.61167 11.6667 0 9.055 0 5.83333C0 2.61167 2.61167 0 5.83333 0ZM7.71147 4.06564L5.10417 6.67295L3.95519 5.52397C3.78434 5.35312 3.50733 5.35312 3.33647 5.52397C3.16562 5.69483 3.16562 5.97184 3.33647 6.14269L4.79481 7.60103C4.96566 7.77188 5.24267 7.77188 5.41353 7.60103L8.33019 4.68436C8.50105 4.5135 8.50105 4.2365 8.33019 4.06564C8.15934 3.89479 7.88233 3.89479 7.71147 4.06564Z',
                                                        windingRule: 'NONZERO',
                                                      ),
                                                    ],
                                                    fills: [
                                                      ShapeDecoration(
                                                        color:
                                                            theme.color.shape,
                                                        shape:
                                                            SmoothRectangleBorder(
                                                          borderRadius:
                                                              SmoothBorderRadius
                                                                  .zero,
                                                          borderAlign:
                                                              BorderAlign
                                                                  .inside,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                        child: ComponentRenderer(
                          child: SizedBox(
                            width: 276.0,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 69.0,
                                  height: 28.0,
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: theme.color.spotIndicator,
                                      shape: SmoothRectangleBorder(
                                        borderRadius: SmoothBorderRadius.only(
                                          topLeft: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          topRight: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          bottomLeft: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          bottomRight: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                        ),
                                        borderAlign: BorderAlign.inside,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: theme.spacing.spotIndicator,
                                        top: theme.spacing.spotIndicator1,
                                        right: theme.spacing.spotIndicator2,
                                        bottom: theme.spacing.spotIndicator3,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 12.0,
                                            height: 12.0,
                                            child: ComponentRenderer(
                                              child: Stack(
                                                children: [
                                                  PositionedDirectional(
                                                    start: theme.spacing.stream,
                                                    end: theme.spacing.stream1,
                                                    top: theme.spacing.stream2,
                                                    bottom:
                                                        theme.spacing.stream3,
                                                    child: SizedBox(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      child: Stack(
                                                        children: [
                                                          PositionedDirectional(
                                                            start: theme
                                                                .spacing.shape4,
                                                            end: theme
                                                                .spacing.shape5,
                                                            top: theme
                                                                .spacing.shape6,
                                                            bottom: theme
                                                                .spacing.shape7,
                                                            child: SizedBox(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              child: PathView(
                                                                geometry: [
                                                                  const Geometry(
                                                                    'M3.5 4.5C3.5 2.42893 5.17893 0.75 7.25 0.75L7.29741 0.75C7.50452 0.75 7.67241 0.582107 7.67241 0.375C7.67241 0.167893 7.50452 0 7.29741 0L7.25 0C4.76472 0 2.75 2.01472 2.75 4.5L2.75 5.125C2.75 5.47018 2.47018 5.75 2.125 5.75L0.375 5.75C0.167893 5.75 0 5.91789 0 6.125C0 6.33211 0.167893 6.5 0.375 6.5L2.125 6.5C2.88439 6.5 3.5 5.88439 3.5 5.125L3.5 4.5ZM7.375 2.5C6.2014 2.5 5.25 3.4514 5.25 4.625L5.25 5.375C5.25 6.96282 3.96282 8.25 2.375 8.25L0.375 8.25C0.167893 8.25 0 8.08211 0 7.875C0 7.66789 0.167893 7.5 0.375 7.5L2.375 7.5C3.5486 7.5 4.5 6.5486 4.5 5.375L4.5 4.625C4.5 3.03718 5.78718 1.75 7.375 1.75L9.625 1.75C9.83211 1.75 10 1.91789 10 2.125C10 2.33211 9.83211 2.5 9.625 2.5L7.375 2.5ZM7.625 4.25C7.27982 4.25 7 4.52982 7 4.875L7 5.5C7 7.98528 4.98528 10 2.5 10L2.375 10C2.16789 10 2 9.83211 2 9.625C2 9.41789 2.16789 9.25 2.375 9.25L2.5 9.25C4.57107 9.25 6.25 7.57107 6.25 5.5L6.25 4.875C6.25 4.11561 6.86561 3.5 7.625 3.5L9.625 3.5C9.83211 3.5 10 3.66789 10 3.875C10 4.08211 9.83211 4.25 9.625 4.25L7.625 4.25Z',
                                                                    windingRule:
                                                                        'NONZERO',
                                                                  ),
                                                                ],
                                                                fills: [
                                                                  ShapeDecoration(
                                                                    color: theme
                                                                        .color
                                                                        .shape1,
                                                                    shape:
                                                                        SmoothRectangleBorder(
                                                                      borderRadius:
                                                                          SmoothBorderRadius
                                                                              .zero,
                                                                      borderAlign:
                                                                          BorderAlign
                                                                              .inside,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: theme.spacing
                                                .spotIndicatorSpaceBetween,
                                          ),
                                          SizedBox(
                                            width: 29.0,
                                            child: Text(
                                              data.text.d15m,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      theme.spacing.spotIndicatorsSpaceBetween,
                                ),
                                SizedBox(
                                  width: 79.0,
                                  height: 28.0,
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: theme.color.spotIndicator1,
                                      shape: SmoothRectangleBorder(
                                        borderRadius: SmoothBorderRadius.only(
                                          topLeft: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          topRight: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          bottomLeft: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                          bottomRight: SmoothRadius(
                                            cornerRadius: 24.0,
                                            cornerSmoothing: 0.0,
                                          ),
                                        ),
                                        borderAlign: BorderAlign.inside,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: theme.spacing.spotIndicator4,
                                        top: theme.spacing.spotIndicator5,
                                        right: theme.spacing.spotIndicator6,
                                        bottom: theme.spacing.spotIndicator7,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 12.0,
                                            height: 12.0,
                                            child: ComponentRenderer(
                                              child: Stack(
                                                children: [
                                                  PositionedDirectional(
                                                    start:
                                                        theme.spacing.stream4,
                                                    end: theme.spacing.stream5,
                                                    top: theme.spacing.stream6,
                                                    bottom:
                                                        theme.spacing.stream7,
                                                    child: SizedBox(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      child: Stack(
                                                        children: [
                                                          PositionedDirectional(
                                                            start: theme
                                                                .spacing.shape8,
                                                            end: theme
                                                                .spacing.shape9,
                                                            top: theme.spacing
                                                                .shape10,
                                                            bottom: theme
                                                                .spacing
                                                                .shape11,
                                                            child: SizedBox(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              child: PathView(
                                                                geometry: [
                                                                  const Geometry(
                                                                    'M3.5 4.5C3.5 2.42893 5.17893 0.75 7.25 0.75L7.29741 0.75C7.50452 0.75 7.67241 0.582107 7.67241 0.375C7.67241 0.167893 7.50452 0 7.29741 0L7.25 0C4.76472 0 2.75 2.01472 2.75 4.5L2.75 5.125C2.75 5.47018 2.47018 5.75 2.125 5.75L0.375 5.75C0.167893 5.75 0 5.91789 0 6.125C0 6.33211 0.167893 6.5 0.375 6.5L2.125 6.5C2.88439 6.5 3.5 5.88439 3.5 5.125L3.5 4.5ZM7.375 2.5C6.2014 2.5 5.25 3.4514 5.25 4.625L5.25 5.375C5.25 6.96282 3.96282 8.25 2.375 8.25L0.375 8.25C0.167893 8.25 0 8.08211 0 7.875C0 7.66789 0.167893 7.5 0.375 7.5L2.375 7.5C3.5486 7.5 4.5 6.5486 4.5 5.375L4.5 4.625C4.5 3.03718 5.78718 1.75 7.375 1.75L9.625 1.75C9.83211 1.75 10 1.91789 10 2.125C10 2.33211 9.83211 2.5 9.625 2.5L7.375 2.5ZM7.625 4.25C7.27982 4.25 7 4.52982 7 4.875L7 5.5C7 7.98528 4.98528 10 2.5 10L2.375 10C2.16789 10 2 9.83211 2 9.625C2 9.41789 2.16789 9.25 2.375 9.25L2.5 9.25C4.57107 9.25 6.25 7.57107 6.25 5.5L6.25 4.875C6.25 4.11561 6.86561 3.5 7.625 3.5L9.625 3.5C9.83211 3.5 10 3.66789 10 3.875C10 4.08211 9.83211 4.25 9.625 4.25L7.625 4.25Z',
                                                                    windingRule:
                                                                        'NONZERO',
                                                                  ),
                                                                ],
                                                                fills: [
                                                                  ShapeDecoration(
                                                                    color: theme
                                                                        .color
                                                                        .shape2,
                                                                    shape:
                                                                        SmoothRectangleBorder(
                                                                      borderRadius:
                                                                          SmoothBorderRadius
                                                                              .zero,
                                                                      borderAlign:
                                                                          BorderAlign
                                                                              .inside,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: theme.spacing
                                                .spotIndicatorSpaceBetween1,
                                          ),
                                          SizedBox(
                                            width: 39.0,
                                            child: Text(
                                              data.text.d2503s,
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
                        ),
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
