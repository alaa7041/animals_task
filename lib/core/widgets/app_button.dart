import 'package:animals_task/core/global/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/font_weights_helper.dart';
import '../theming/styles.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? radius;
  final Widget? widget;
  final BoxBorder? boxBorder;
  final Color? color, textColor;
  final Color? loaderColor;
  final Function()? onPressed;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    this.height,
    this.onPressed,
    this.width,
    this.radius = 10,
    this.boxBorder,
    this.color,
    this.textColor,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.textStyle,
    this.isLoading = false,
    this.widget,
    this.loaderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 48.height,
        width: width ?? double.infinity,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 8.r),
            border: boxBorder,
            color: color ?? ColorsManager.primary),
        child:  Center(
                child: widget ??
                    AppText(
                      title: text,
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 16.font,
                      fontWeight: fontWeight ?? FontWeightsHelper.bold,
                      style: textStyle ??
                          Styles.buttonText().copyWith(
                            color: Colors.white,
                          ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: textAlign ?? TextAlign.center,
                    ),
              ),
      ),
    );
  }
}
