import 'package:animals_task/core/global/dimensions.dart';
import 'package:flutter/material.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';
import 'app_text.dart';

class RowTextInline extends StatelessWidget {
  final String? title, subTitle;
  final Widget? widget;
  final MainAxisAlignment align;
  final Function()? onTap;

  const RowTextInline(
      {super.key,
      this.align = MainAxisAlignment.center,
      this.onTap,
      this.widget,
      this.title,
      this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: align,
      children: [
        SizedBox(
          width: 200.width,
          child: AppText(
            title: "${title ?? ""} ",
            style: Styles.p5Medium().copyWith(
              color: ColorsManager.textSecondary,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: AppText(
            title: subTitle ?? "",
            style: Styles.p5Medium(),
          ),
        ),
      ],
    );
  }
}
