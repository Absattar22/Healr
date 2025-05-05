import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    // تهيئة قاعدة بيانات المناطق الزمنية
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));

    // إعدادات تهيئة الأندرويد
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/logo');

    // إعدادات التهيئة العامة
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    // تهيئة الإضافة
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        debugPrint("تم النقر على الإشعار: ${details.payload}");
      },
    );

    // طلب إذن الإشعارات للأندرويد
    if (Platform.isAndroid) {
      final androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await androidImplementation?.requestNotificationsPermission();
    }
  }

  /// جدولة إشعار يومي في وقت محدد مع إشعار تحضيري قبل 30 دقيقة
  static Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required TimeOfDay timeOfDay,
    String prepTitle = "استعد للدواء",
    String prepBody = "حان وقت تناول الطعام أو الاستعداد للدواء!",
    String prepPayload = "prep_notification",
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    // إذا كان الوقت المجدول في الماضي، جدوله لليوم التالي
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    // جدولة الإشعار التحضيري (قبل 30 دقيقة)
    final prepScheduledDate = scheduledDate.subtract(const Duration(minutes: 30));

    const androidDetails = AndroidNotificationDetails(
      'medication_channel_id',
      'تذكيرات الدواء',
      channelDescription: 'إشعارات لتذكير بمواعيد الدواء',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    // جدولة الإشعار التحضيري
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id + 1000, // معرف فريد للإشعار التحضيري
      prepTitle,
      prepBody,
      prepScheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: prepPayload,
    );

    // جدولة إشعار الدواء الرئيسي
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: payload,
    );

    debugPrint(
        "تم جدولة إشعار يومي: ID $id في ${timeOfDay.hourOfPeriod}:${timeOfDay.minute.toString().padLeft(2, '0')} ${timeOfDay.period == DayPeriod.am ? 'AM' : 'PM'}");
    debugPrint(
        "تم جدولة إشعار تحضيري: ID ${id + 1000} في ${prepScheduledDate.hour}:${prepScheduledDate.minute}");
  }

/// جدولة إشعارات متكررة بفاصل زمني مع إشعار تحضيري
static Future<void> scheduleIntervalNotification({
  required int id,
  required String title,
  required String body,
  required String payload,
  required Duration interval, // مثل كل 8 ساعات
  String prepTitle = "استعد للدواء",
  String prepBody = "حان وقت تناول الطعام أو الاستعداد للدواء!",
  String prepPayload = "prep_notification",
}) async {
  final now = tz.TZDateTime.now(tz.local);
  // أول إشعار بعد 5 ثوانٍ من الآن
  final firstNotificationTime = now.add(const Duration(seconds: 5));
  // الإشعار التحضيري قبل 30 دقيقة من أول إشعار
  var prepNotificationTime = firstNotificationTime.subtract(const Duration(minutes: 30));

  // إذا كان الإشعار التحضيري في الماضي، اجعله بعد ثوانٍ من الآن
  if (prepNotificationTime.isBefore(now)) {
    prepNotificationTime = now.add(const Duration(seconds: 5));
  }

  const androidDetails = AndroidNotificationDetails(
    'medication_channel_id',
    'تذكيرات الدواء',
    channelDescription: 'إشعارات لتذكير بمواعيد الدواء',
    importance: Importance.max,
    priority: Priority.high,
  );

  const notificationDetails = NotificationDetails(android: androidDetails);

  // جدولة الإشعار التحضيري
  await flutterLocalNotificationsPlugin.zonedSchedule(
    id + 1000,
    prepTitle,
    prepBody,
    prepNotificationTime,
    notificationDetails,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    payload: prepPayload,
  );

  // جدولة إشعار الدواء الأول
  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    firstNotificationTime,
    notificationDetails,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    payload: payload,
  );

  // جدولة الإشعارات المتكررة يدويًا لدعم فواصل مخصصة
  for (int i = 1; i <= 5; i++) { // جدولة 5 إشعارات متكررة كمثال
    final nextNotificationTime = firstNotificationTime.add(interval * i);
    final nextPrepTime = nextNotificationTime.subtract(const Duration(minutes: 30));

    // جدولة الإشعار التحضيري المتكرر
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id + 1000 + i,
      prepTitle,
      prepBody,
      nextPrepTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: prepPayload,
    );

    // جدولة إشعار الدواء المتكرر
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id + i,
      title,
      body,
      nextNotificationTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
  }

  debugPrint(
      "تم جدولة إشعار متكرر: ID $id كل ${interval.inHours} ساعات");
  debugPrint(
      "تم جدولة إشعار تحضيري: ID ${id + 1000} في ${prepNotificationTime.hour}:${prepNotificationTime.minute}");
}
  /// إظهار الإشعارات المجدولة
  static Future<void> getPendingNotifications() async {
    final List<PendingNotificationRequest> requests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    debugPrint("📋 عدد الإشعارات المجدولة: ${requests.length}");
    for (var request in requests) {
      debugPrint(
          "➡️ [ID: ${request.id}] العنوان: ${request.title}, المحتوى: ${request.payload}");
    }
  }

  /// إظهار الإشعارات النشطة
  static Future<void> getActiveNotifications() async {
    final androidImpl =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    final active = await androidImpl?.getActiveNotifications();
    debugPrint("🟢 عدد الإشعارات النشطة: ${active?.length ?? 0}");
    if (active != null) {
      for (var notification in active) {
        debugPrint("🔔 نشط: ${notification.id} - ${notification.title}");
      }
    }
  }
}