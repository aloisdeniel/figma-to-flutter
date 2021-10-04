import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/widgets/adaptative_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/form.dart';

class EnterCredentialsLayout extends ConsumerWidget {
  const EnterCredentialsLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Material(
      child: AppAdaptativeWindow(
        child: CredentialsForm(),
      ),
    );
  }
}
