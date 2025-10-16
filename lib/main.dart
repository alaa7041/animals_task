import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(390, 812),
        builder: (_, child) {
          return MaterialApp(
            useInheritedMediaQuery: true,
           
            debugShowCheckedModeBanner: false,
            title: "Animals",
            theme: ThemeData(
              fontFamily: 'inter',
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            ),
            home: Scaffold(),
          );
        },
      ),
    );
  }
}
