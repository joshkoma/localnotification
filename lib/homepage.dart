import 'package:flutter/material.dart';
import 'package:localnotification/components/notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Notifications.init();
    //initialize timezon
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Local Notification Test',
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Local Notificaitons Test',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 500,
              child: ElevatedButton(
                  onPressed: Notifications.showNotification,
                  child: Text(
                    'Show Simple Notification',
                    style: TextStyle(fontSize: 25),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 500,
              child: ElevatedButton(
                  onPressed: Notifications.periodicNotification,
                  child: Text(
                    'Show Periodic Notification',
                    style: TextStyle(fontSize: 25),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 500,
              child: ElevatedButton(
                  onPressed: Notifications.scheduleNotification,
                  child: Text(
                    'Show Scheduled Notification',
                    style: TextStyle(fontSize: 25),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 500,
              child: ElevatedButton(
                  onPressed: Notifications.cancelNotifications,
                  child: Text(
                    'Cancel All Notifications',
                    style: TextStyle(fontSize: 25),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
