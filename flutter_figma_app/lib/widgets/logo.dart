import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class FlintyLogo extends StatelessWidget {
  const FlintyLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/flinty_logo.svg',
      width: 92,
      height: 92,
    );
  }
}
