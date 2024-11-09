import 'package:flutter/material.dart';

import '../utils.dart';

class FontConst {
   //This file usage is optional
  //Note - if you are using this method then,please follow this type of naming style-
  //   1. font  2. fontSize (ex - 14,16)  3. fontColor (orange,red) 4. weight (Medium ,Bold)
  // so naming will be like this - "font14OrangeMedium";

  static String fontStyleName = "Poppins";



  static TextStyle font32black = TextStyle(
    color: Colors.black,
    fontSize: 32,
    fontFamily: fontStyleName,
  );

  static TextStyle font14OrangeMedium = const TextStyle(
    color: Color(0xffFF8B20),
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle font32blackBold = TextStyle(
    color: Colors.black,
    fontSize: 32,
    fontFamily: fontStyleName,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font22black = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontFamily: fontStyleName,
  );

  static TextStyle font17black = const TextStyle(
    color: Colors.black,
    fontSize: 17,
  );

  static TextStyle font17blackMedium =
  const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500);

  static TextStyle font20BlueMedium = const TextStyle(
    color: Color(0xff005B88),
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font20OrangeBold = const TextStyle(
    color: Color(0xffFF8B20),
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font15grey = TextStyle(
    color: const Color(0xff494949),
    fontSize: 15,
    fontFamily: fontStyleName,
  );
  static TextStyle font15Black = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: fontStyleName,
  );
  static TextStyle font15BlackMedium = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: fontStyleName,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font18Black = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: fontStyleName,
  );

  static TextStyle font18BlackMedium = const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font24BlackMedium = const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font20BlackMedium = const TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font18Blacklight = const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );

  static TextStyle font12grey = TextStyle(
    color: const Color(0xff71839B),
    fontSize: 12,
    fontFamily: fontStyleName,
  );

  static TextStyle font12GreyBold = const TextStyle(
      color: Color(0xff6F6F84), fontSize: 12, fontWeight: FontWeight.w600);

  static TextStyle font12GreenBold = const TextStyle(
      color: ColorsUtils.defaultThemeColor,
      fontSize: 12,
      fontWeight: FontWeight.w600);

  static TextStyle font14GreenMeddium = const TextStyle(
      color: ColorsUtils.defaultThemeColor,
      fontSize: 14,
      fontWeight: FontWeight.w500);

  static TextStyle font12black = const TextStyle(
    color: Colors.black,
    fontSize: 12,
  );

  static TextStyle font12_5e = TextStyle(
    color: const Color(0xff5E5E5E),
    fontSize: 12,
    fontFamily: fontStyleName,
  );

  static TextStyle font12_81 = TextStyle(
    color: const Color(0xff818181),
    fontSize: 12,
    fontFamily: fontStyleName,
  );

  static TextStyle font12LightBlack = TextStyle(
    color: const Color(0xff324054),
    fontSize: 12,
    fontFamily: fontStyleName,
  );

  static TextStyle font15Orange = TextStyle(
    color: const Color(0xffFF8B20),
    fontSize: 15,
    fontFamily: fontStyleName,
  );

  static TextStyle font15OrangeMedium = TextStyle(
    color: const Color(0xffFF8B20),
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: fontStyleName,
  );

  static TextStyle font14LightBlack = TextStyle(
    color: const Color(0xff454545),
    fontSize: 14,
    fontFamily: fontStyleName,
  );

  static TextStyle font14Grey = TextStyle(
    color: const Color(0xff6F6F84),
    fontSize: 14,
    fontFamily: fontStyleName,
  );

  static TextStyle appBarFont = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: fontStyleName,
  );
  static TextStyle font16Black = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: fontStyleName,
  );

  static TextStyle font16BlackMedium = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: fontStyleName,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font16OrangeMedium = TextStyle(
      color: const Color(0xffFF8B20),
      fontSize: 16,
      fontFamily: fontStyleName,
      fontWeight: FontWeight.w500);

  static TextStyle font18BlackLight = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontFamily: fontStyleName,
  );

  static TextStyle font24WhiteBold = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: fontStyleName,
  );
  static TextStyle font16White = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: fontStyleName,
  );

  static TextStyle font12White = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: fontStyleName,
  );
  static TextStyle font17BlueDark = TextStyle(
    color: const Color(0xff2A4958),
    fontSize: 17,
    fontFamily: fontStyleName,
  );

  static TextStyle font13Black = TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontFamily: fontStyleName,
  );

  static TextStyle font16BlueBold = TextStyle(
    color: const Color(0xff3684AA),
    fontSize: 16,
    fontFamily: fontStyleName,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font18DarkBlue = TextStyle(
    color: const Color(0xff00618F),
    fontSize: 18,
    fontFamily: fontStyleName,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font17BlueMedium = TextStyle(
    color: const Color(0xff3684AA),
    fontWeight: FontWeight.w500,
    fontSize: 17,
    fontFamily: fontStyleName,
  );

  static TextStyle font14Black = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: fontStyleName,
  );

  static TextStyle font15Red = TextStyle(
    color: const Color(0xffFF0000),
    fontSize: 15,
    fontFamily: fontStyleName,
  );

  static TextStyle font15DarkGreen = TextStyle(
    color: const Color(0xff0B3F20),
    fontSize: 15,
    fontFamily: fontStyleName,
  );

  static TextStyle font14BlackBold = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font18Blue = const TextStyle(
    color: Color(0xff3684AA),
    fontSize: 18,
  );

  static TextStyle font16Blue = TextStyle(
    color: const Color(0xff2D68FE),
    fontSize: 16,
    fontFamily: fontStyleName,
  );

  static TextStyle font16LightBlack = TextStyle(
    color: const Color(0xff324054),
    fontSize: 16,
    fontFamily: fontStyleName,
  );

  static TextStyle selectedBottomBarStyle = TextStyle(
    color: const Color(0xffFF8B20),
    fontSize: 11,
    fontFamily: fontStyleName,
  );

  static TextStyle font17OrangeBold = TextStyle(
    color: const Color(0xffFF8B20),
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: fontStyleName,
  );

  static TextStyle font17Orange = TextStyle(
    color: const Color(0xffFF8B20),
    fontSize: 17,
    fontFamily: fontStyleName,
  );

  static TextStyle font17Red = TextStyle(
    color: const Color(0xffFF0000),
    fontSize: 17,
    fontFamily: fontStyleName,
  );

  static TextStyle font17Green = TextStyle(
    color: const Color(0xff10B501),
    fontSize: 17,
    fontFamily: fontStyleName,
  );

  static TextStyle unselectedBottomBarStyle = TextStyle(
    color: const Color(0xffB7B7B7),
    fontSize: 11,
    fontFamily: fontStyleName,
  );
  static TextStyle font12Red = const TextStyle(
    color: Color(0xffEB1A15),
    fontSize: 12,
  );
}
