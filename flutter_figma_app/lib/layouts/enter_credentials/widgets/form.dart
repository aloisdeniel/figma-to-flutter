import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/adaptative/adaptative.dart';
import 'package:flutter_figma_app/adaptative/adaptative_size_builder.dart';
import 'package:flutter_figma_app/adaptative/data.dart';
import 'package:flutter_figma_app/state/figma.dart';
import 'package:flutter_figma_app/state/helpers/async.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/adaptative_window.dart';
import 'package:flutter_figma_app/widgets/button.dart';
import 'package:flutter_figma_app/widgets/spacing.dart';
import 'package:flutter_figma_app/widgets/logo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'enter_file_id.dart';
import 'enter_token.dart';

class CredentialsForm extends StatefulWidget {
  const CredentialsForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CredentialsForm> createState() => _CredentialsFormState();
}

class _CredentialsFormState extends State<CredentialsForm> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppAdaptativeSizeBuilder(
      builder: (context, size, _) {
        final formChildren = [
          const Center(
            child: FlintyLogo(),
          ),
          const AppGap.regular(),
          Text(
            'flinty.dev',
            style: theme.textStyle.title1.copyWith(
              color: theme.color.primary1,
            ),
            textAlign: TextAlign.center,
          ),
          const AppGap.big(),
          Text(
            'Create a Figma API key, get the identifier of a Figma file, and import all of its component.',
            style: theme.textStyle.body1.copyWith(
              color: theme.color.foreground1,
            ),
            textAlign: TextAlign.center,
          ),
          const AppGap.big(),
          const EnterToken(),
          const AppGap.big(),
          const EnterFileId(),
        ];

        final validateButton = Consumer(builder: (context, ref, _) {
          final isValid = ref.watch(figma.apiToken.validator).mergeValues2(
              ref.watch(figma.fileId.validator), (tokenValid, fileIdValid) {
            return [tokenValid, fileIdValid].every((e) => e == true);
          });
          return AppButton(
            onTap: isValid.maybeMap(
              data: (data) => data.value
                  ? () {
                      figma.openFile(ref);
                    }
                  : null,
              orElse: () => null,
            ),
            child: const AppPadding.regular(
              child: Text('Import file'),
            ),
          );
        });

        if (size == AppAdaptativeSize.small) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: formChildren,
                ),
              ),
              validateButton,
            ],
          );
        }

        return ListView(
          shrinkWrap: true,
          children: [
            ...formChildren,
            const AppGap.big(),
            validateButton,
          ],
        );
      },
    );
  }
}
