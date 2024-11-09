import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hamilton_base_project/routes.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Home/home_screen.dart';
import 'Service/local_notification_services.dart';
import 'Utils/local_storage.dart';

late SharedPreferences prefs;
late LocalStorage localStorage;

Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint("background handler called");
  LocalNotificationService.handleNotificationNavigation(
      routeName: message.data["screenName"] ?? "",
      id: message.data["id"] ?? "");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

   //todo: open comments when need notification
  // await Firebase.initializeApp();
  // await handleNotificationPermission();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // LocalNotificationService.initialize();
  // handleNotification();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Hamilton Base Project",
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.teal,

      ),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.getPages,
      initialRoute: HomeScreen.routeName,
    );
  }
}



Future<void> handleNotificationPermission() async {
  const permission = Permission.notification;
  final status = await permission.status;
  if (status.isGranted) {
    debugPrint('User granted this permission before');
  } else {
    final before = await permission.shouldShowRequestRationale;
    final rs = await permission.request();
    final after = await permission.shouldShowRequestRationale;

    if (rs.isGranted) {
      debugPrint('User granted notication permission');
    } else if (!before && after) {
      debugPrint('Show permission request pop-up and user denied first time');
    } else if (before && !after) {
      debugPrint('Show permission request pop-up and user denied a second time');
    } else if (!before && !after) {
      debugPrint('No more permission pop-ups displayed');
    }
  }
}

void handleNotification() {
  // 1. This method call when app in terminated state and you get a notification
  FirebaseMessaging.instance.getInitialMessage().then(
        (message) {
      if (message?.notification != null) {
        LocalNotificationService.handleNotificationNavigation(
            routeName: message?.data["screenName"] ?? "",
            id: message?.data["id"] ?? "");
      }
    },
  );

  // 2. This method only call when App in forground it mean app must be opened
  FirebaseMessaging.onMessage.listen(
        (message) {
      debugPrint("FirebaseMessaging.onMessage.listen");
      debugPrint(message.data.toString());
      if (message.notification != null) {
        LocalNotificationService.createAndDisplayNotification(message);
      }
    },
  );

  // 3. This method only call wh  en App in background and not terminated(not closed)
  FirebaseMessaging.onMessageOpenedApp.listen(
        (message) {
      debugPrint(
          "FirebaseMessaging.onMessageOpenedApp.listen app was in background");
      if (message.notification != null) {
        LocalNotificationService.handleNotificationNavigation(
            routeName: message.data["screenName"], id: message.data["id"]);
      }
    },
  );


}