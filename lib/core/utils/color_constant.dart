import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9003f = fromHex('#3f000000');

  static Color green600 = fromHex('#34a853');
  static Color mainGreenColor = fromHex('#38b000');

  static Color green500 = fromHex('#3ce443');

  static Color black900 = fromHex('#000000');

  static Color gray20001 = fromHex('#ececec');

  static Color redA400 = fromHex('#ff1818');

  static Color gray20002 = fromHex('#ebebeb');

  static Color blueGray900 = fromHex('#202244');

  static Color gray20005 = fromHex('#f0efef');

  static Color gray20003 = fromHex('#eaeaea');

  static Color gray20004 = fromHex('#e7e7e7');

  static Color gray600 = fromHex('#6e6e6e');

  static Color gray500 = fromHex('#979797');

  static Color amber400 = fromHex('#ffc926');

  static Color blueGray400 = fromHex('#888888');

  static Color amber500 = fromHex('#f5be18');

  static Color lime900 = fromHex('#946021');

  static Color orange700 = fromHex('#e77d00');

  static Color gray200 = fromHex('#e8e8e8');

  static Color gray300 = fromHex('#e0e0e0');

  static Color gray100 = fromHex('#f8f7f7');

  static Color gray10002 = fromHex('#f7f6f6');

  static Color gray10001 = fromHex('#f6f6f6');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
