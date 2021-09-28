import 'package:flutter/widgets.dart';
import 'package:path_icon/path_icon.dart';

abstract class AppIcons {
  static final PathIconData componentSelected = PathIconData.fromData(
    'M0 56L57 0L114 56L57 112L0 56Z',
    viewBox: const Rect.fromLTWH(0, 0, 114, 114),
  );
  static final PathIconData componentNotSelected = PathIconData.fromData(
    'M0 56L57 112L114 56L57 0L0 56ZM14.269 56L57 97.9814L99.731 56L57 14.0186L14.269 56Z',
    viewBox: const Rect.fromLTWH(0, 0, 114, 114),
  );
  static final PathIconData componentSetSelected = PathIconData.fromData(
    'M0 57.2756L25.4558 31.8198L50.9117 57.2756L25.4558 82.7315L0 57.2756Z M31.8198 25.4558L57.2757 0L82.7315 25.4558L57.2757 50.9117L31.8198 25.4558Z M62.9325 56.5685L88.3883 31.1127L113.844 56.5685L88.3883 82.0244L62.9325 56.5685Z M31.1127 88.3883L56.5685 62.9325L82.0244 88.3883L56.5685 113.844L31.1127 88.3883Z',
    viewBox: const Rect.fromLTWH(0, 0, 114, 114),
  );
  static final PathIconData componentSetNotSelected = PathIconData.fromData(
    'M31.8198 25.4558L57.2757 50.9117L82.7315 25.4558L57.2757 0L31.8198 25.4558ZM45.962 25.4558L57.2757 14.1421L68.5894 25.4558L57.2757 36.7696L45.962 25.4558ZM62.9325 56.5685L88.3883 82.0244L113.844 56.5685L88.3883 31.1127L62.9325 56.5685ZM77.0746 56.5685L88.3883 67.8823L99.702 56.5685L88.3883 45.2548L77.0746 56.5685ZM82.0244 88.3883L56.5685 62.9325L31.1127 88.3883L56.5685 113.844L82.0244 88.3883ZM67.8822 88.3883L56.5685 99.702L45.2548 88.3883L56.5685 77.0746L67.8822 88.3883ZM50.9117 57.2756L25.4558 31.8198L0 57.2756L25.4558 82.7315L50.9117 57.2756ZM36.7696 57.2756L25.4558 68.5893L14.1421 57.2756L25.4558 45.9619L36.7696 57.2756Z',
    viewBox: const Rect.fromLTWH(0, 0, 114, 114),
  );
}

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.data, {
    Key? key,
    this.size = 20,
    this.color,
  }) : super(key: key);

  final PathIconData data;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return PathIcon(
      data,
      size: size,
      color: color,
    );
  }
}
