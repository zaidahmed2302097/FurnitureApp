import 'package:efurniture_application/Utils/app_colours.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String assetImage = 'assets/images/';
  static const String assetImageAll = 'assets/images/all_products/';
  static const String assetImageBed = 'assets/images/bed/';
  static const String assetImageChair = 'assets/images/chairs/';
  static const String assetImageCouch = 'assets/images/couch/';
  static const String assetImageCupboard = 'assets/images/cupboard/';
  static const String assetImageLamp = 'assets/images/lamp/';
  static const String gelasioTextFont = 'Gelasio';
  static const String interTextFont = 'Inter';
  static const String assetSvgIcons = 'assets/SvgIcons/';
  static const String assetIcons = 'assets/icons/';

  static const textborder = OutlineInputBorder(
    borderSide: BorderSide(),
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(30),
    ),
  );

  static const focusedTextBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColours.darkGreenColour,
    ),
  );
}
