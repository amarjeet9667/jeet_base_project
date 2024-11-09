import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StylesUtils {
  static UnderlineInputBorder textFieldUnderlineBorder = UnderlineInputBorder(
    borderSide: const BorderSide(
      color: ColorsUtils.textFieldBorderColor,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(10.0),
  );

  static OutlineInputBorder textFieldOutsideBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey, width: 1.2),
    borderRadius: BorderRadius.circular(10.0),
  );
}

class ColorsUtils {
  static const Color defaultThemeColor = Color(0xffF78C26);
  static const Color textFieldBorderColor = Color(0xffF78C26);
  static const Color textFieldActiveIconColor = Color(0xff4E9CC2);
  static const Color navigationBarColor = Color(0xffF2F2F2);
  static const Color selectedBlueColor = Color(0xff2D68FE);
  static const Color unselectedGreyColor = Color(0xff71839B);
  static const Color unselectedBottomBarColor = Color(0xff939393);
  static const Color dividerBlueColor = Color(0xff3684AA);
  static const Color dividerGreyColor = Color(0xff5B5B5B);
  static const Color secendoryBackgroundColor = Color(0xffF2F7EE);
}

class Utils {
  static void message({String? title, String? body, bool? error}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(body ?? ''),backgroundColor: error == true ? Colors.red : Colors.black,),
    );
  }
}