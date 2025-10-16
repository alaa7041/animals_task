import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/utils.dart';
import '../routing/route_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onTrailingTap;
  final bool withArrow;
  final String? city, contry;
  final bool? withCustomIcon;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.onTrailingTap,
    this.withArrow = false,
    this.withCustomIcon,
    this.city,
    this.contry,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: withArrow
          ? (withCustomIcon ?? false)
              ? GestureDetector(
                  onTap: () => RouteManager.pop(),
                  child: Icon(Icons.arrow_back_ios_new_rounded))
              : GestureDetector(
                  onTap: () => RouteManager.pop(),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(Utils.getIconsSVGPath("back")),
                  ))
          : SizedBox.shrink(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
