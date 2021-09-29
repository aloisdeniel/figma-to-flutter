import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';

class Resizable extends StatefulWidget {
  const Resizable({
    Key? key,
    required this.child,
    required this.initialSize,
    this.handleSize = const Size(18, 18),
    this.maxSize = const Size(500, 500),
  }) : super(key: key);

  final Widget child;
  final Size initialSize;
  final Size handleSize;
  final Size maxSize;

  @override
  _ResizableState createState() => _ResizableState();
}

class _ResizableState extends State<Resizable> {
  late Size size = widget.initialSize;

  void _update({
    double? width,
    double? height,
  }) {
    final newSize = Size(
      max(widget.handleSize.width * 2, width ?? size.width),
      max(widget.handleSize.height * 2, height ?? size.height),
    );
    setState(() {
      size = newSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.handleSize.width / 2,
              vertical: widget.handleSize.height / 2,
            ),
            width: size.width,
            height: size.height,
            child: widget.child,
          ),
          Positioned(
            key: const Key('Right-Top'),
            right: 0,
            top: 0,
            child: ResizeHandle(
              size: widget.handleSize,
              onDrag: (dx, dy) {
                _update(
                  width: size.width + dx * 2,
                  height: size.height - dy * 2,
                );
              },
            ),
          ),
          Positioned(
            key: const Key('Right-Center'),
            right: 0,
            top: size.height / 2 - widget.handleSize.height / 2,
            child: ResizeHandle(
              size: widget.handleSize,
              onDrag: (dx, dy) {
                _update(
                  width: size.width + dx * 2,
                );
              },
            ),
          ),
          Positioned(
            key: const Key('Right-Bottom'),
            right: 0,
            bottom: 0,
            child: ResizeHandle(
              size: widget.handleSize,
              onDrag: (dx, dy) {
                _update(
                  width: size.width + dx * 2,
                  height: size.height + dy * 2,
                );
              },
            ),
          ),
          Positioned(
            key: const Key('Left-Top'),
            left: 0,
            top: 0,
            child: ResizeHandle(
              size: widget.handleSize,
              onDrag: (dx, dy) {
                _update(
                  width: size.width - dx * 2,
                  height: size.height - dy * 2,
                );
              },
            ),
          ),
          Positioned(
            key: const Key('Left-Bottom'),
            left: 0,
            bottom: 0,
            child: ResizeHandle(
              size: widget.handleSize,
              onDrag: (dx, dy) {
                _update(
                  width: size.width - dx * 2,
                  height: size.height + dy * 2,
                );
              },
            ),
          ),
          Positioned(
            key: const Key('Left-Center'),
            left: 0,
            top: size.height / 2 - widget.handleSize.height / 2,
            child: ResizeHandle(
              size: widget.handleSize,
              onDrag: (dx, dy) {
                _update(
                  width: size.width - dx * 2,
                );
              },
            ),
          ),
          Positioned(
            key: const Key('Center-Top'),
            left: size.width / 2 - widget.handleSize.width / 2,
            top: 0,
            child: ResizeHandle(
              size: widget.handleSize,
              onDrag: (dx, dy) {
                _update(
                  height: size.height - dy * 2,
                );
              },
            ),
          ),
          Positioned(
            key: const Key('Center-Bottom'),
            left: size.width / 2 - widget.handleSize.width / 2,
            bottom: 0,
            child: ResizeHandle(
              size: widget.handleSize,
              onDrag: (dx, dy) {
                _update(
                  height: size.height + dy * 2,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

typedef ResizeCallback = void Function(double dx, double dy);

class ResizeHandle extends StatefulWidget {
  const ResizeHandle({
    Key? key,
    required this.size,
    required this.onDrag,
  }) : super(
          key: key,
        );
  final Size size;
  final ResizeCallback onDrag;

  @override
  _ResizeHandleState createState() => _ResizeHandleState();
}

class _ResizeHandleState extends State<ResizeHandle> {
  late double _startX;
  late double _startY;

  _handleDrag(details) {
    setState(() {
      _startX = details.globalPosition.dx;
      _startY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - _startX;
    var dy = details.globalPosition.dy - _startY;
    _startX = details.globalPosition.dx;
    _startY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        decoration: BoxDecoration(
          color: theme.color.primary1.withOpacity(0.35),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
