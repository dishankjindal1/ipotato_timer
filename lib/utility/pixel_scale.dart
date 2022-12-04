import 'package:flutter/material.dart';

class PixelScale {
  static late MediaQueryData _mediaQueryData;

  static late double width;
  static late double height;

  static late double text;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    height = _mediaQueryData.size.height / 100;
    width = _mediaQueryData.size.width / 100;
    
    text = _mediaQueryData.devicePixelRatio;
  }
}

extension PixelScaleExtension on num {
  double ws() => this * PixelScale.width;

  double hs() => this * PixelScale.height;

  double t() => this * PixelScale.text;
}
