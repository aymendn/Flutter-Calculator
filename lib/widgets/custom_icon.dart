import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/index.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
    this.icon, {
    Key? key,
    required this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  final String icon;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? colorScheme.historyBg.withOpacity(.6) : null,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
          color: isSelected ? colorScheme.historyIcon : null,
        ),
        padding: const EdgeInsets.all(5),
      ),
    );
  }
}
