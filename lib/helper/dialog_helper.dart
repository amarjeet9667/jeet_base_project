
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DialogHelper {

  //.............................................show loading................................
  static Future<void> showLoading({
    String? message,
    bool? barrierDismissible = false
  }) async {

    await Get.dialog(

      Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: PopScope(
          canPop: barrierDismissible ?? false,
          onPopInvoked: (value) async {

          },
          child: Container(
            // width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CupertinoActivityIndicator(),
                const SizedBox(height: 8),
                Text(message ?? 'Loading...'),
              ],
            ),
          ),
        ),
      ),
      /*Scaffold(
        backgroundColor: Colors.transparent,
        body: Dialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0);,
          child: Container(
            width: 120,
            height: 120,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CupertinoActivityIndicator(),
                const SizedBox(height: 8),
                Text(message ?? 'Loading...'),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),*/
      barrierDismissible: barrierDismissible ?? false,
      barrierColor: Colors.grey.withOpacity(.2),
      /*Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20.0),
                    Text(
                      message ?? "Loading...",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),*/

    );
  }

  static Future<void> hideLoading() async {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }


  //..................................................show error dialog.....................................................
  static void showErrorDialog({String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineMedium,
              ),
              Text(
                description ?? '',
                style: Get.textTheme.titleLarge,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //......................................show toast.........................................

  static void showFlutterToast({required String strMsg}) async {
    await Fluttertoast.showToast(msg: strMsg);
  }

  //....................................show snack bar.......................................
  static void showSnackBar({String title = "Alert!", required String strMsg}) {
    Get.snackbar(
        title, strMsg,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM
    );
  }

  static hideKeyboard()  {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<void> showAppDialog({
    Widget? child,
    bool? barrierDismissible,
    bool? header = false,
    String? heading,
    Color? dialogBGColor,
    BorderRadiusGeometry? borderRadius,
    MainAxisAlignment? mainAxisAlignment,
  }) async {

    log('barrierDismissible: $barrierDismissible');

    Widget children = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [

        Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.08,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading ?? '',
                // style: textStyleBB20,
              ),

              CloseButton(
                color: Colors.white,
                onPressed: () {
                  Get.back();
                },
              )

            ],
          ),
        ),

        child ?? const SizedBox(),

      ],
    );

    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: Get.height * .012, vertical: Get.height * .012),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12.0),
        ),
        backgroundColor: dialogBGColor,
        child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: ( header == true
              ? children
              : child
          )
              ?? const Text("data"),
        ),
      ),

      barrierDismissible: barrierDismissible ?? false,
      barrierColor: Colors.grey.withOpacity(.2),
      routeSettings: RouteSettings(
        arguments: Navigator.canPop(Get.context!),
      ),
    );
  }

}
