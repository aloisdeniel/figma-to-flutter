import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';

class Tap extends StatelessWidget {
  const Tap({
    Key? key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.color,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget child;
  final SmoothBorderRadius? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final accent = color ?? const Color(0xFF4FD1BA);
    const foreground = Color(0xFF363360);
    Widget tapArea = Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: accent.withOpacity(0.2),
        hoverColor: Colors.black.withOpacity(0.2),
        splashColor: accent.withOpacity(0.2),
        highlightColor: foreground.withOpacity(0.05),
        onTap: onTap,
        child: Container(),
      ),
    );

    if (borderRadius != null) {
      tapArea = ClipSmoothRect(
        radius: borderRadius!,
        child: tapArea,
      );
    }

    return Stack(
      children: [
        child,
        Positioned.fill(
          child: tapArea,
        ),
      ],
    );
  }
}
