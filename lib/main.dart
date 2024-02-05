import 'package:efurniture_application/Utils/app_colours.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Screens/inital_page.dart';
import 'Utils/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: customTheme(),
          home: const SafeArea(child: InitailPage()),
        );
      },
    );
  }

  ThemeData customTheme() => ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColours.scaffoldBkColour,
        inputDecorationTheme: const InputDecorationTheme(
          prefixIconColor: AppColours.whiteBackgroundColor,
          hintStyle: TextStyle(
              fontFamily: AppConstants.interTextFont,
              fontWeight: FontWeight.w700),
        ),
      );
}
