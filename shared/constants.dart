import 'package:flutter/material.dart';


class Constants {
  static String appId = '1:357984166913:web:ab581ac5de4e6bd5400c00';
  static String apiKey ='AIzaSyByQ_14H7sEU6sg5PafW3A-3c8lJq7pTIo';
  static String messagingSenderId = '357984166913';
  static String projectId = 'labmaid-fastapi-auth';
}

//追加したコード

class AppColors {
  AppColors._();

  static const Color black = Color(0xff626262);
  static const Color radiantWhite = Color(0xffffffff);
  static const Color white = Color(0xfff0f0f0);
  static const Color bluishGrey = Color(0xffdddee9);
  static const Color navyBlue = Color(0xff6471e9);
  static const Color lightNavyBlue = Color(0xffb3b9ed);
  static const Color red = Color(0xfff96c6c);
  static const Color grey = Color(0xffe0e0e0);
}

class AppConstants {
  AppConstants._();

  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(
      width: 2,
      color: AppColors.lightNavyBlue,
    ),
  );

  static InputDecoration get inputDecoration => InputDecoration(
    border: inputBorder,
    disabledBorder: inputBorder,
    errorBorder: inputBorder.copyWith(
      borderSide: BorderSide(
        width: 2,
        color: AppColors.red,
      ),
    ),
    enabledBorder: inputBorder,
    focusedBorder: inputBorder,
    focusedErrorBorder: inputBorder,
    hintText: "Event Title",
    hintStyle: TextStyle(
      color: AppColors.black,
      fontSize: 17,
    ),
    labelStyle: TextStyle(
      color: AppColors.black,
      fontSize: 17,
    ),
    helperStyle: TextStyle(
      color: AppColors.black,
      fontSize: 17,
    ),
    errorStyle: TextStyle(
      color: AppColors.red,
      fontSize: 12,
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),
  );
}

class BreakPoints {
  static const double web = 800;
}




