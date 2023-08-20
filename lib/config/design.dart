import 'package:flutter/material.dart';

class DesignSystem {
  static const px = 20.0;
  static const py = 30.0;
  static const textxl = 48.0;
  static const textlg = 36.0;
  static const textmd = 20.0;
  static const textsm = 16.0;
  static const textxs = 14.0;
  static const vred = Color.fromRGBO(253, 69, 87, 0.866);
  static const vmblue = Color.fromARGB(255, 22, 22, 28);
  static const voffwhite = Color.fromARGB(255, 244, 240, 224);
  static const gaps = 10.0;
  static const gapl = 40.0;
  static const gapm = 20.0;
}

class Gap extends StatelessWidget {
  final double size;

  Gap(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
