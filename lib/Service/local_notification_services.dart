import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize() {


    // initializationSettings  for Android
    const iosInitializationSetting = DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/launcher_icon"),
      iOS: iosInitializationSetting,
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (res) async {
        debugPrint("onSelectNotification : ${res.payload}");

        var data = jsonDecode(res.payload.toString());

        String id = data["id"];
        String screenName = data["screenName"];

        handleNotificationNavigation(routeName: screenName, id: id);


      },
    );
  }



  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
          'default_notification_channel_id',
          'Notification',
          importance: Importance.max,
          priority: Priority.high,
        ),
      );



      await _notificationsPlugin.show(
          id,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
          payload:
          jsonEncode( {"other" : message.data['other'].toString(),
            "screenName" :   message.data['screenName'].toString(),
            "id" : message.data["id"].toString()
          },)


      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  static void handleNotificationNavigation({
    required String routeName,
    required String id
  }) {
    debugPrint("id : $id");
    debugPrint("screenName : $routeName");

    //   if (screenName == "deliveryListingSupervisorScreen") {
    //     Get.to(() => DailyApprovalScreenSupervisor());
    //   } else if (screenName == "transferRequestFromSupervisor") {
    //     Get.to(() => ApprovalListSupervisor());
    //   } else if (screenName == "incidentReportSupervisorScreen") {
    //     // Get.to(()=> );
    //   } else if (screenName == "transferlistDriverScreen") {
    //     Get.to(() => ViewTransferScreen());
    //   } else if (screenName == "transferlistSupervisorScreen") {
    //     Get.to(() => MyTransferSupervisorScreen());
    //   } else if (screenName == "DeliveryListingDriverScreen") {
    //     Get.to(() => DeliveryScreen());
    //   } else if (screenName == "deliveryListingDriverScreen") {
    //     Get.to(() => DeliveryScreen());
    //   } else if (screenName == "shiftListingDriverScreen") {
    //     Get.to(() => ManageShiftScreen());
    //   } else if (screenName == "bankTransferSupervisorScreen") {
    //     Get.to(() => GetBankTransferSupervisorScreen());
    //   } else if (screenName == "bankTransferDriverScreen") {
    //     Get.to(() => GetBankTransferDriverScreen());
    //   }
  }
}