import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/index.dart';
import '../providers/calculations.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key, required this.operation, required this.result})
      : super(key: key);

  final String operation;
  final String result;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          CustomTextButton(
            text: operation,
            textColor: colorScheme.opText,
          ),
          CustomTextButton(
            text: result,
            textColor: colorScheme.resultText,
            fontSize: 25,
            isResult: true,
          ),
        ],
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    this.isResult = false,
    this.fontSize,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Color? textColor;
  final double? fontSize;
  final bool isResult;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.topButtonBg,
      child: InkWell(
        onTap: () =>
            Provider.of<Calculations>(context, listen: false).add(text),
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Text(
            isResult ? '= $text' : text,
            textAlign: TextAlign.end,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
