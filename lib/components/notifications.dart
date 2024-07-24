import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class Notifications {
  //initialize the notifications plugin
  static final _notifications = FlutterLocalNotificationsPlugin();

  //define init map
  static Future init({bool scheduled = false}) async {
    var initAndroidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = DarwinInitializationSettings();
    final settings =
        InitializationSettings(android: initAndroidSettings, iOS: ios);
    await _notifications.initialize(settings);
  }

//method to show simple notification
  static Future showNotification() async {
    print('Local Notification Triggered');
    _notifications.show(
      0,
      'Basic Test',
      'Simple Notification',
      await notificationDetails(),
    );
  }

  static Future periodicNotification() async {
    print('Periodic Notification Triggered');
    //define notification details
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'repeating channel id',
      'repeating channel name',
      channelDescription: 'repeating description',
      importance: Importance.max,
      channelShowBadge: true,
      ticker: 'ticker',
    );

    const NotificationDetails notificationDetails2 =
        NotificationDetails(android: androidNotificationDetails);
    await _notifications.periodicallyShow(
        2,
        'Periodic Notification',
        'This is a periodic notification',
        RepeatInterval.everyMinute,
        notificationDetails2,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

   static Future scheduleNotification() async {
    print('Scheduled Notification Triggered');
    
    
    //define notification details
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'ScheduledID',
      'ScheduledID',
      channelDescription: 'RepeatID',
      importance: Importance.max,
      channelShowBadge: true,
      ticker: 'ticker',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    
    await _notifications.zonedSchedule(
        3,
        'Scheduled Notification',
        'This is a scheduled notification',
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 10)),
        notificationDetails, uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

  static Future cancelNotifications() async {
    print('All notifications cancelled');
    _notifications.cancelAll();
  }

  // static Future scheduledNotification() async {
  //   _notifications.zonedSchedule(4, 'Scheduled', 'This is a scheduled notification',
  //    scheduledDate, await notificationDetails(),
  //    uiLocalNotificationDateInterpretation: uiLocalNotificationDateInterpretation)
  // }
}

notificationDetails() async {
  return NotificationDetails(
      android: AndroidNotificationDetails('id 1', 'name 1',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          ticker: 'ticker'
          // sound: RawResourceAndroidNotificationSound(_sound)
          ),
      iOS: DarwinNotificationDetails());
}
