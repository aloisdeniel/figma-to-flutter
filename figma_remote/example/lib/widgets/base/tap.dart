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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: accent.withOpacity(0.2),
        hoverColor: accent.withOpacity(0.2),
        splashColor: accent.withOpacity(0.2),
        highlightColor: accent.withOpacity(0.2),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
