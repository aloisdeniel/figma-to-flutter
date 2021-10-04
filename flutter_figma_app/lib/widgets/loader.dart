import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SpinKitCubeGrid(
      size: theme.textStyle.body1.fontSize! * 2.5,
      color: theme.color.primary1,
    );
  }
}
