import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/layouts/enter_credentials/layout.dart';
import 'package:flutter_figma_app/layouts/result/layout.dart';
import 'package:flutter_figma_app/state/figma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeLayout extends ConsumerWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credentials = ref.watch(figma.credentials);

    if (credentials == null) {
      return const EnterCredentialsLayout();
    }
    return const ResultLayout();
  }
}
