import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamilton_base_project/Utils/ReusableWidget/reusable_button.dart';
import '../image_path.dart';
import 'font_const.dart';

void reusablePopup(
    {required BuildContext context,
    required bool isSuccess,
    required String message,
    required String buttonText,
      required void Function()? onTap,
      bool barrierDismissible = true,
    }) {
  showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width - 36,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height:  16
                  ),
                  Image.asset(
                    isSuccess
                        ? ImagePath.successGif
                        : ImagePath.failedGif,
                    height: Get.height*.2,
                    width: Get.height*.2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                         message,
                    textAlign: TextAlign.center,
                    style: FontConst.font18BlackMedium,
                  ),
                  const Spacer(),
                  ReusableButton(
                      title:  buttonText,
                      ontap:  onTap ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      });
}