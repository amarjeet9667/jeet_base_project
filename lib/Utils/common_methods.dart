import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamilton_base_project/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ReusableWidget/reusable_snackbar.dart';

class CommonMethods {

  static String getUserToken() {
    String? userId = prefs.getString("user-token");
    return userId ?? "";
  }

  static String getUserId() {
    String? userId = prefs.getString("user-id");
    return userId ?? "";
  }

  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> launchYourUrl({required String url}) async {
    //Todo : if you are using this please add this in your manifest file-
    // <queries>
    // <intent>
    // <action android:name="android.intent.action.VIEW" />
    // <category android:name="android.intent.category.BROWSABLE" />
    // <data android:scheme="https" />
    // </intent>
    // </queries>

       Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      showSnackBar(message: "Enable to launch url",isForError: true);
    }
  }

  Future<void> redirectPhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> redirectSMS(String phoneNumber) async {

    try {
      if (Platform.isAndroid) {
        String uri = 'sms:$phoneNumber?body=${Uri.encodeComponent("Hello there")}';
        await launchUrl(Uri.parse(uri));
      } else if (Platform.isIOS) {
        String uri = 'sms:$phoneNumber&body=${Uri.encodeComponent("Hello there")}';
        await launchUrl(Uri.parse(uri));
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Some error occurred. Please try again!'),
        ),
      );
    }

  }



}
