import 'package:animals_task/core/global/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routing/route_manager.dart';

class Utils {
  static const String dummyBookAsset = 'assets/images/dummy/book.png';

  static Color getColor(String color) {
    final myColor = "0xff${color.replaceFirst("#", "")}";
    return Color(int.parse(myColor));
  }

  static String getAssetPNGPath(String image) {
    return 'assets/images/$image.png';
  }

  static String getImagesSVGPath(String image) {
    return 'assets/images/$image.svg';
  }

  static String getIconsSVGPath(String image) {
    return 'assets/icons/$image.svg';
  }

  static String getIconsPNGPath(String image) {
    return 'assets/icons/$image.png';
  }

  static String getAssetGIFPath(String image) {
    return 'assets/images/gif/$image.gif';
  }

  static String getAssetLottiePath(String image) {
    return 'assets/images/lottie/$image.json';
  }

  static String getAssetDummyPNGPath(String image) {
    return 'assets/dummy/$image.png';
  }

  static String getAssetDummyJPGPath(String image) {
    return 'assets/dummy/$image.jpg';
  }

  static double get bottomDevicePadding {
    final bottom = MediaQuery.of(RouteManager.currentContext).padding.bottom;
    if (bottom < 16) {
      return 16.h;
    }
    return bottom;
  }

  static double get topDevicePadding {
    final top = MediaQuery.of(RouteManager.currentContext).padding.top;
    // if (top < 44) {
    //   return 44.height;
    // }
    return top;
  }

  static double get appBarHeight {
    return AppBar().preferredSize.height;
  }

  static EdgeInsets get viewPadding {
    return EdgeInsets.fromLTRB(20.width, 45.height, 20.width, 0);
  }

  static double keyboardHeight(context,
      {bool subtractBottomDevicePadding = false}) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    if (keyboardHeight == 0) {
      return keyboardHeight;
    }
    keyboardHeight += 16.h;
    if (subtractBottomDevicePadding) {
      return keyboardHeight - bottomDevicePadding;
    }
    return keyboardHeight;
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String getFileNameFromURL(String url, String symbol) =>
      url.substring(url.lastIndexOf(symbol) + 1);

  static String formatTime(TimeOfDay? value, {bool format24Hours = true}) {
    if (value == null) {
      return "";
    }
    final hours = value.hour;
    final minutes = value.minute;
    if (format24Hours) {
      return '${(hours).toString().padLeft(2, '0')}:${(minutes).toString().padLeft(2, '0')}';
    }
    return '${((hours > 12) ? hours - 12 : hours == 0 ? 12 : hours).toString().padLeft(2, '0')}:${(minutes).toString().padLeft(2, '0')} ${value.period.name.toUpperCase()}';
  }

  // static ThemeData get datePickerTheme {
  //   return Theme.of(RouteManager.currentContext).copyWith(
  //     colorScheme: ColorScheme.light(
  //       primary: context.colors.primary,
  //       onPrimary: context.colors.secondary,
  //       onSurface: context.colors.secondary,
  //     ),
  //     textTheme: TextTheme(
  //       displayLarge: TextStyle(
  //         fontSize: 10,
  //       ),
  //       bodyLarge: TextStyle(
  //         color: context.colors.primary,
  //       ),
  //       labelSmall: TextStyle(
  //         color: context.colors.secondary,
  //         fontSize: 16,
  //         fontWeight: FontWeight.w700,
  //       ),
  //     ),
  //     textButtonTheme: TextButtonThemeData(
  //       style: TextButton.styleFrom(
  //         foregroundColor: context.colors.primary,
  //       ),
  //     ),
  //   );
  // }

  static void log(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static String formatDuration(Duration? duration) {
    if (duration == null) {
      return "--:--:--";
    }
    int hours = duration.inHours % 24;
    int minutes = duration.inMinutes % 60;
    int seconds = duration.inSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
