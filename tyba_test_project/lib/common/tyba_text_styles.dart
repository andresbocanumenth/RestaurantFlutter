import 'package:flutter/material.dart';

class TybaTextStyles {
  static const BigTextSize = 40.0;
  static const LargeTextSize = 18.0;
  static const MediumTextSize = 16.0;
  static const BodyTextSize = 14.0;

  // Font Family
  static const String FontFamilyDefault = 'EncodeSans';

  // Text Styles
  static const WhiteMediumBoldTextStyle = TextStyle(
    fontFamily: FontFamilyDefault,
    fontWeight: FontWeight.bold,
    fontSize: MediumTextSize,
    color: Colors.white,
  );

  static const BlackMediumBoldTextStyle = TextStyle(
    fontFamily: FontFamilyDefault,
    fontWeight: FontWeight.bold,
    fontSize: MediumTextSize,
    color: Colors.black,
  );

  static const GrayBodyNormalTextStyle = TextStyle(
    fontFamily: FontFamilyDefault,
    fontWeight: FontWeight.normal,
    fontSize: BodyTextSize,
    color: Colors.grey,
  );
}