import 'package:flutter/material.dart';

import 'button.dart';

class ButtonsGrid extends StatelessWidget {
  const ButtonsGrid({Key? key, required this.grid}) : super(key: key);

  final List<List<String>> grid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: grid
          .map(
            (row) => Expanded(
              child: Row(
                children: row.map((buttonText) => Button(buttonText)).toList(),
              ),
            ),
          )
          .toList(),
    );
  }
}
