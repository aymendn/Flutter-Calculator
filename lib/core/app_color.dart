import 'package:flutter/material.dart';

// Main Colors (Primary and Secondary)
class AppColor {
  const AppColor._();

  static const primaryLight = Color(0xff6f4ced);
  static const secondaryLight = Color(0xff937CE6);

  static const primaryDark = Color(0xff6344d4);
  static const secondaryDark = secondaryLight;
}

// Further Color Cutomization
extension CustomColorScheme on ColorScheme {
  Gradient get gradient => const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xffA430FF),
          Color(0xffF318AD),
          Color(0xffFF2171),
        ],
      );

  Color get grey1 => const Color(0xff171C22);
  Color get grey2 => const Color(0xff212A35);
  Color get grey3 => const Color(0xff2E3A48);
  Color get grey4 => const Color(0xff5A6876);
  Color get grey5 => const Color(0xff828A93);
  Color get grey6 => const Color(0xffEAEBED);
  Color get grey7 => const Color(0xffFEFEFF);

  Color get gridBg => brightness == Brightness.light
      ? const Color(0xffC9BAFF)
      : const Color(0xff222B36);

  Color get bg => brightness == Brightness.light
      ? const Color(0xffEBE5FF)
      : const Color(0xff171C22);

  Color get cursor => brightness == Brightness.light ? primary : secondary;

  Color get historyBorder => brightness == Brightness.light ? secondary : grey4;

  Color get historyIcon => brightness == Brightness.light ? grey7 : grey1;

  Color get historyBg => brightness == Brightness.light ? primary : grey6;

  Color get resultText => brightness == Brightness.light ? primary : grey7;

  Color get buttonText => brightness == Brightness.light ? grey2 : grey6;

  Color get opText => brightness == Brightness.light ? grey4 : grey5;

  Color get switchText => brightness == Brightness.light ? grey5 : grey4;

  Color get buttonBg => brightness == Brightness.light ? grey7 : grey1;

  Color get topButtonBg => brightness == Brightness.light ? grey6 : grey3;
}
