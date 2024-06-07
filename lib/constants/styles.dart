
import 'package:flutter/material.dart';
import 'package:impacteers_screening_test/constants/colors.dart';

class Styles{

  String fontFamilyName = "SF-Pro-Display";

   TextStyle semiBoldTextStyle({Color? color,double? fontSize}){
    return TextStyle(
      color: color ?? baseColor,
      fontFamily: fontFamilyName,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle boldTextStyle({Color? color,double? fontSize}){
    return TextStyle(
      color: color ?? baseColor,
      fontFamily: fontFamilyName,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle mediumTextStyle({Color? color,double? fontSize}){
    return TextStyle(
      color: color ?? baseColor,
      fontFamily: fontFamilyName,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle regularTextStyle({Color? color,double? fontSize}){
    return TextStyle(
      color: color ?? baseColor,
      fontFamily: fontFamilyName,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle headBoldTextStyle({Color? color,double? fontSize}){
    return TextStyle(
      color: color ?? baseColor,
      fontFamily: fontFamilyName,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.w900,
    );
  }
}