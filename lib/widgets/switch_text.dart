import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/index.dart';
import '../providers/theme_provider.dart';

class SwitchText extends StatelessWidget {
  const SwitchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final themeProvider = Provider.of<ThemeProvider>(context);
    return Text(
      themeProvider.switchToText(context),
      style: theme.textTheme.bodyText2!
          .copyWith(color: theme.colorScheme.switchText, fontSize: 14),
    );
  }
}