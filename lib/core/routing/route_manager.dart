import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Route<dynamic>? onGenerateRoute(RouteSettings settings) => null;

class RouteManager {
  static BuildContext get currentContext => navigatorKey.currentContext!;

  static Future<dynamic> navigateTo(
    Widget page, {
    RouteAnimation animation = RouteAnimation.none,
  }) =>
      navigatorKey.currentState!.push(_customPageRoute(page, animation));

  static Future<dynamic> navigateAndReplaceCurrentScreen(
    Widget page, {
    RouteAnimation animation = RouteAnimation.none,
  }) =>
      navigatorKey.currentState!.pushReplacement(
        _customPageRoute(page, animation),
      );

  static Future<dynamic> navigateAndPopAll(
    Widget page, {
    RouteAnimation animation = RouteAnimation.none,
  }) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        _customPageRoute(page, animation),
        (_) => false,
      );

  static Future<dynamic> navigateAndPopUntilFirstPage(
    Widget page, {
    RouteAnimation animation = RouteAnimation.none,
  }) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        _customPageRoute(page, animation),
        (route) => route.isFirst,
      );

  // can pop or not
  static bool canPop() => navigatorKey.currentState!.canPop();

  static void pop([Object? result]) =>
      !canPop() ? null : navigatorKey.currentState!.pop(result);

  static Route<dynamic> _customPageRoute(
    Widget page,
    RouteAnimation animationType,
  ) {
    // Use CupertinoPageRoute for slide animation to enable iOS swipe back gesture
    if (animationType == RouteAnimation.slide) {
      return CupertinoPageRoute(builder: (context) => page);
    }

    // Use MaterialPageRoute for none animation with iOS swipe back support
    if (animationType == RouteAnimation.none) {
      return MaterialPageRoute(builder: (context) => page);
    }

    // Use PageRouteBuilder for custom animations
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (animationType) {
          case RouteAnimation.fade:
            return FadeTransition(opacity: animation, child: child);

          case RouteAnimation.scale:
            return ScaleTransition(scale: animation, child: child);

          case RouteAnimation.slide:
            // This case is handled above with CupertinoPageRoute
            return child;

          case RouteAnimation.slideFromBottom:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0), // From bottom
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );

          case RouteAnimation.scaleFromBottom:
            return AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                return ClipPath(
                  clipper: RevealClipper(animation.value),
                  child: child,
                );
              },
            );

          case RouteAnimation.none:
           
            return child;
        }
      },
    );
  }
}

enum RouteAnimation {
  slide,
  fade,
  scale,
  slideFromBottom,
  scaleFromBottom,
  none,
}

class RevealClipper extends CustomClipper<Path> {
  final double revealPercent;

  RevealClipper(this.revealPercent);

  @override
  Path getClip(Size size) {
    final center = Offset(size.width / 2, size.height); // bottom center
    final radius = revealPercent * size.longestSide * 1.2;
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(RevealClipper oldClipper) =>
      revealPercent != oldClipper.revealPercent;
}
