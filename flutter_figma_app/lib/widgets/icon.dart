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

  static final PathIconData flutter =
      PathIconData.fromSvg('''<svg viewBox="0 0 114 114">
<path fill-rule="evenodd" clip-rule="evenodd" d="M58.1932 84.5981L48.4431 94.3482L60.27 106.175H79.7702L58.1932 84.5981ZM91.8753 111.189H58.1931L41.3521 94.3482L58.1932 77.5071L91.8753 111.189Z" fill="white"/>
<path d="M5.00024 58.1588L60.3175 2.84108L93.9998 2.84121L21.8413 74.9999L5.00024 58.1588Z" fill="white"/>
<path d="M32.5775 85.7361L55.2222 63.0914L88.9045 63.0915L49.4186 102.577L32.5775 85.7361Z" fill="white"/>
</svg>
''');

  static final PathIconData dart =
      PathIconData.fromSvg('''<svg viewBox="0 0 114 114">
<path d="M21 22.5L79 21L86.4999 24.5L110 48L110 92.5L91 92.5L21 22.5Z" fill="white"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M21 22.5L91 92.5L91 111H45.5L21.7499 88.583L19.8778 78.9551L21 22.5ZM25.7657 34.3368L86 94.5711V106H47.487L26.3511 86.0505L24.8874 78.5228L25.7657 34.3368Z" fill="white"/>
<path d="M4 58L21 22.5L22.5 87.5L4 68L4 58Z" fill="white"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M56.2015 10L64.4289 10L73.5116 19.0827L40.5404 17.9882L56.2015 10ZM55 5H66.5L86 24.5L21 22.3423L55 5Z" fill="white"/>
</svg>
''');
}

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.data, {
    Key? key,
    this.size = 16,
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
