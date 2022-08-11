import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/history.dart';
import 'history_list.dart';

class CustomAnimatedSwitcher extends StatelessWidget {
  const CustomAnimatedSwitcher({
    Key? key,
    required this.grid,
  }) : super(key: key);

  final Widget grid;

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<History>(context);
    return AnimatedSwitcher(
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (Widget child, Animation<double> animation) =>
          ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: history.isShowHistory ? const HistoryList() : grid,
    );
  }
}
