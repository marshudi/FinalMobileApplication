import 'package:flutter_local_notifications/flutter_local_notifications.dart';



class LocalNotification{

  // import plugin

  static final FlutterLocalNotificationsPlugin flnp=FlutterLocalNotificationsPlugin();

  //setting
  static Future startNoti() async{
    AndroidInitializationSettings andoSetting= const AndroidInitializationSettings("mipmap/ic_launcher");
    await flnp.initialize(InitializationSettings(android:andoSetting ));
  }


  //show
  // id, title,body
  static Future showNoti({required int id,required String title,required String body }) async{

    var channelInfo=AndroidNotificationDetails("100", "myChannel");

    await flnp.show(id, title, body, NotificationDetails(android: channelInfo));


  }





}