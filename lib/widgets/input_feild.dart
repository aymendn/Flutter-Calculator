import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calculations.dart';

import '../core/index.dart';

class InputFeild extends StatefulWidget {
  const InputFeild({Key? key}) : super(key: key);

  @override
  State<InputFeild> createState() => _InputFeildState();
}

class _InputFeildState extends State<InputFeild> {
  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<Calculations>(context);
    final theme = Theme.of(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      alignment: Alignment.bottomRight,
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 200),
        tween: Tween<double>(begin: 20, end: calc.inputFontSize),
        builder: (BuildContext context, double value, Widget? child) {
          return Scrollbar(
            controller: calc.scrollController,
            thumbVisibility: true,
            radius: const Radius.circular(20),
            child: TextField(
              maxLines: isLandscape ? 1 : null,
              expands: !isLandscape,
              showCursor: true,
              readOnly: true,
              autofocus: true,
              controller: calc.controller,
              focusNode: calc.focusNode,
              scrollController: calc.scrollController,
              scrollPadding: const EdgeInsets.all(3),
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
              cursorColor: theme.colorScheme.cursor,
              cursorWidth: 4,
              cursorRadius: const Radius.circular(20),
              style: TextStyle(
                fontSize: value,
                color: calc.isShowingResult
                    ? theme.colorScheme.switchText
                    : theme.colorScheme.onBackground,
              ),
            ),
          );
        },
      ),
    );
  }
}
