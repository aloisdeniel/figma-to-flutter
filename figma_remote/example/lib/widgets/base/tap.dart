import 'package:flutter/material.dart';

class Tap extends StatelessWidget {
  const Tap({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF4FD1BA);
    const foreground = Color(0xFF363360);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: accent.withOpacity(0.2),
        hoverColor: Colors.black.withOpacity(0.2),
        splashColor: accent.withOpacity(0.2),
        highlightColor: foreground.withOpacity(0.05),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
