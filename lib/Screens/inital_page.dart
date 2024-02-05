//import 'package:efurniture_application/Routes/app_navigation.dart';
//import 'package:efurniture_application/Routes/app_navigation_routes.dart';

import 'package:efurniture_application/Screens/home_screen.dart';
import 'package:efurniture_application/Utils/app_colours.dart';
import 'package:efurniture_application/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InitailPage extends StatelessWidget {
  const InitailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                '${AppConstants.assetImage}bkground.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(14.h),
            Padding(
              padding: const EdgeInsets.only(left: 46.0),
              child: Text(
                'Make your'.toUpperCase(),
                style: TextStyle(
                    color: AppColours.lightGreyColour,
                    fontSize: 21.sp,
                    fontFamily: 'Gelasio',
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'HOME BEAUTIFUL'.toUpperCase(),
                  style: TextStyle(
                      color: AppColours.blackButtonColor,
                      fontSize: 22.sp,
                      fontFamily: 'Gelasio',
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Gap(53.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Home1Screen();
                    },
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(30),
                height: 60,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColours.lightGreenColour,
                ),
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColours.whiteBackgroundColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
