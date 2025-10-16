import 'package:flutter/material.dart';

import '../helpers/utils.dart';
import '../theming/colors.dart';

enum AppFontFamily {
  alexandriaArabic(id: "Cairo"),
  montserrat(id: "Cairo"),
  ;

  const AppFontFamily({required this.id});

  final String id;
}

class AppText extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final double? height;
  final AppFontFamily? fontFamily;
  final EdgeInsetsGeometry padding;
  final void Function()? onTap;
  final Color? color;
  final TextStyle? style;

  const AppText({
    super.key,
    required this.title,
    this.fontSize,
    this.textAlign,
    this.decoration,
    this.overflow,
    this.fontWeight = FontWeight.w400,
    this.maxLines,
    this.height,
    this.fontFamily,
    this.softWrap,
    this.padding = EdgeInsets.zero,
    this.onTap,
    this.color,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          key: key,
          textAlign: textAlign ?? TextAlign.start,
          textScaler: const TextScaler.linear(1),
          style: style ??
              TextStyle(
                color: color ?? ColorsManager.textPrimary,
                fontSize: fontSize,
                height: height != null ? height! / fontSize! : null,
                decoration: decoration ?? TextDecoration.none,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 2,
                decorationColor: color,
                fontWeight: fontWeight,
                fontFamily: fontFamily?.id ,
              ),
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
        ),
      ),
    );
  }
}
