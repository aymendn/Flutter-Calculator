import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.portrait,
    required this.landscape,
  }) : super(key: key);

  final Widget portrait;
  final Widget landscape;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.portrait ? portrait : landscape;
      },
    );
  }
}
