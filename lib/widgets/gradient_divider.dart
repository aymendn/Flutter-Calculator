import 'package:flutter/material.dart';

import '../core/index.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 6,
      decoration: BoxDecoration(gradient: colorScheme.gradient),
    );
  }
}
