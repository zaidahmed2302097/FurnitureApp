import 'package:efurniture_application/Data/all_products.dart';
import 'package:efurniture_application/Data/filters.dart';
import 'package:efurniture_application/Utils/app_colours.dart';
import 'package:efurniture_application/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class Home1Screen extends StatefulWidget {
  const Home1Screen({super.key});

  @override
  State<Home1Screen> createState() => _Home1ScreenState();
}

class _Home1ScreenState extends State<Home1Screen> {
  String? selectedFilter = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      // centerTitle: true,
      // title: Text(
      //   'Furniture Shop',
      //   style: TextStyle(
      //       fontSize: 24.sp, fontFamily: AppConstants.gelasioTextFont),
      // ),
      //backgroundColor: AppColours.scaffoldBkColour,
      //),
      body: Column(
        children: [
          Gap(4.h),
          // Padding(
          //   padding: const EdgeInsets.only(left: 17.0),
          //   child: Text(
          //     'Furniture Collection',
          //     style: TextStyle(
          //         fontSize: 24.sp, fontFamily: AppConstants.gelasioTextFont),
          //   ),
          // ),
          Gap(3.w),
          SizedBox(
            width: 90.w,
            child: const TextField(
              decoration: InputDecoration(
                focusedBorder: AppConstants.focusedTextBorder,
                prefixIcon: Icon(
                  Icons.search,
                ),
                border: UnderlineInputBorder(),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontFamily: AppConstants.interTextFont,
                ),
              ),
            ),
          ),

          // Filter List View

          Gap(3.h),
          SizedBox(
            height: 12.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filters[index]['title'];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          //padding: const EdgeInsets.only(top: 5),
                          height: 6.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: selectedFilter == filters[index]['title']
                                ? AppColours.lightGreenColour
                                : AppColours.whiteBackgroundColor,
                          ),
                          child: Image.asset(
                            '${AppConstants.assetIcons}$index.png',
                            height: 3.h,
                            width: 5.w,
                            color: selectedFilter == filters[index]['title']
                                ? AppColours.whiteBackgroundColor
                                : AppColours.darkGreenColour,
                          ),
                        ),
                      ),
                      Text(
                        '${filters[index]['title']}',
                        style: const TextStyle(
                          color: AppColours.whiteBackgroundColor,
                          fontFamily: AppConstants.interTextFont,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // All Products List View

          Expanded(
            //height: 40.h,
            //width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                return Container(
                  color: AppColours.whiteBackgroundColor,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text('${allProducts[index]['title']}'),
                      Text('Price : \$ ${allProducts[index]['price']}'),
                      Image.asset('${AppConstants.assetImageAll}$index.png'),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
