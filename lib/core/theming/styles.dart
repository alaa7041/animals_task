import 'package:animals_task/core/global/dimensions.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class Styles {
  static const String englishFontFamily = 'Poppins';
  static const Color fontColor = ColorsManager.textPrimary;


  static TextStyle h1Bold() => TextStyle(
        fontFamily: englishFontFamily,
        fontSize: 24.font,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: fontColor,
      );

  static TextStyle h2Medium() => TextStyle(
        fontFamily: englishFontFamily,
        fontSize: 20.font,
        fontWeight: FontWeight.w500,
        height: 1.2,
        color: fontColor,
      );

  static TextStyle h3Regular() => TextStyle(
        fontFamily: englishFontFamily,
        fontSize: 18.font,
        fontWeight: FontWeight.w400,
        height: 1.2,
        color: fontColor,
      );



  static TextStyle bodyLarge() => TextStyle(
        fontFamily: englishFontFamily,
        fontSize: 16.font,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: fontColor,
      );

  static TextStyle bodyRegular() => TextStyle(
        fontFamily: englishFontFamily,
        fontSize: 14.font,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: ColorsManager.textSecondary,
      );

  static TextStyle bodySmall() => TextStyle(
        fontFamily: englishFontFamily,
        fontSize: 12.font,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: ColorsManager.textSecondary,
      );
  static TextStyle buttonText() => TextStyle(
        fontFamily: englishFontFamily,
        fontSize: 16.font,
        fontWeight: FontWeight.w500,
        color: ColorsManager.background,
      );


  static TextStyle labelMedium() => TextStyle(
        fontFamily: englishFontFamily,
        fontSize: 13.font,
        fontWeight: FontWeight.w500,
        color: ColorsManager.textSecondary,
      );

  static TextStyle labelSmall() => TextStyle(
        fontFamily: englishFontFamily,
        fontSize: 11.font,
        fontWeight: FontWeight.w400,
        color: ColorsManager.textSecondary,
      );
}
