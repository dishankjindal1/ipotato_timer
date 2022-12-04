import 'package:flutter/material.dart';
import 'package:ipotato_timer/utility/utility_imports.dart';

/// Text Styles picked up from figma file
///
/// All the Naming convention are from figma file
/// TS - is appended, short form for Text Style
class MyTextStyles {
  /// ----------------- Body Text Style Vairants ------------------ ///

  static TextStyle smallBodyTS = TextStyle(
    fontSize: 4.ws(),
    // fontSize: 12.0,
    // height: 16.0,
    letterSpacing: 0.4,
  );

  static TextStyle mediumBodyTS = TextStyle(
    fontSize: 4.5.ws(),
    // fontSize: 14.0,
    // height: 20.0,
    letterSpacing: 0.25,
  );

  static TextStyle largeBodyTS = TextStyle(
    fontSize: 5.ws(),
    // fontSize: 16.0,
    // height: 24.0,
    letterSpacing: 0.5,
  );

  /// ----------------- Headline Text Style Vairants ------------------ ///

  static TextStyle smallHeadlineTS = TextStyle(
    fontSize: 6.ws(),
    // fontSize: 24.0,
    // height: 32.0,
  );

  static TextStyle mediumHeadlineTS = TextStyle(
    fontSize: 7.ws(),
    // fontSize: 28.0,
    // height: 36.0,
  );

  static TextStyle largeHeadlineTS = TextStyle(
    fontSize: 8.ws(),
    // fontSize: 32.0,
    // height: 40.0,
  );

  /// ----------------- Title Text Style Vairants ------------------ ///
  static TextStyle smallTitleTS = TextStyle(
    fontSize: 3.5.ws(),

    // fontSize: 14.0,
    // height: 20.0,
    // letterSpacing: 0.1,
  );

  static TextStyle mediumTitleTS = TextStyle(
    fontSize: 6.ws(),
    // height: 24.0,
    // letterSpacing: 0.1,
  );

  static TextStyle largeTitleTS = TextStyle(
    fontSize: 7.ws(),
    // height: 28.0,
  );

  /// ----------------- Label Text Style Vairants ------------------ ///
  static TextStyle smallLabelTS = TextStyle(
    fontSize: 5.ws(),
    // height: 20.0,
    // letterSpacing: 0.1,
  );

  static TextStyle mediumLabelTS = TextStyle(
    fontSize: 6.ws(),
    // height: 24.0,
    // letterSpacing: 0.1,
  );

  static TextStyle largeLabelTS = TextStyle(
    fontSize: 5.5.ws(), fontWeight: FontWeight.w500,
    // fontSize: 22.0,
    // height: 28.0,
  );
}
