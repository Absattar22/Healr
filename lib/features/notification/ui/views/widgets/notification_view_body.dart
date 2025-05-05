import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/notification/ui/views/widgets/custom_notification_app_bar.dart';
import 'package:healr/features/notification/ui/views/widgets/custom_notification_container.dart';
import 'package:healr/features/notification/ui/views/widgets/local_notification.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomNotificationAppBar(),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'Today',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff666666),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const CustomNotificationContainer(
                img: 'assets/images/medicine.svg',
                notificationTitle: 'Medicine Reminder',
                notificationDescription:
                    'reminder : Take 1 tablet of paracetamol every 6 hours',
                time: '5m ago',
                isMedicine: true,
              ),
              SizedBox(
                height: 4.h,
              ),
              const CustomNotificationContainer(
                img: 'assets/images/medicine.svg',
                notificationTitle: 'Medicine Reminder',
                notificationDescription:
                    'reminder : Take 1 tablet of paracetamol every 6 hours',
                time: '5m ago',
              ),
              SizedBox(
                height: 4.h,
              ),
              const CustomNotificationContainer(
                img: 'assets/images/medicine.svg',
                notificationTitle: 'Medicine Reminder',
                notificationDescription:
                    'reminder : Take 1 tablet of paracetamol every 6 hours',
                time: '5m ago',
              ),
              SizedBox(
                height: 4.h,
              ),
              const CustomNotificationContainer(
                img: 'assets/images/medicine.svg',
                notificationTitle: 'Medicine Reminder',
                notificationDescription:
                    'reminder : Take 1 tablet of paracetamol every 6 hours',
                time: '5m ago',
              ),
              SizedBox(
                height: 4.h,
              ),
              const CustomNotificationContainer(
                img: 'assets/images/medicine.svg',
                notificationTitle: 'Medicine Reminder',
                notificationDescription:
                    'reminder : Take 1 tablet of paracetamol every 6 hours',
                time: '5m ago',
              ),
              SizedBox(
                height: 4.h,
              ),
              const CustomNotificationContainer(
                img: 'assets/images/medicine.svg',
                notificationTitle: 'Medicine Reminder',
                notificationDescription:
                    'reminder : Take 1 tablet of paracetamol every 6 hours',
                time: '5m ago',
              ),
              SizedBox(
                height: 4.h,
              ),
              const CustomNotificationContainer(
                img: 'assets/images/medicine.svg',
                notificationTitle: 'Medicine Reminder',
                notificationDescription:
                    'reminder : Take 1 tablet of paracetamol every 6 hours',
                time: '5m ago',
              ),
              SizedBox(
                height: 4.h,
              ),
              const CustomNotificationContainer(
                img: 'assets/images/medicine.svg',
                notificationTitle: 'Medicine Reminder',
                notificationDescription:
                    'reminder : Take 1 tablet of paracetamol every 6 hours',
                time: '5m ago',
              ),
              SizedBox(
                height: 4.h,
              ),
              const CustomNotificationContainer(
                img: 'assets/images/medicine.svg',
                notificationTitle: 'Medicine Reminder',
                notificationDescription:
                    'reminder : Take 1 tablet of paracetamol every 6 hours',
                time: '5m ago',
              ),
              SizedBox(
                height: 4.h,
              ),
              const CustomNotificationContainer(
                img: 'assets/images/medicine.svg',
                notificationTitle: 'Medicine Reminder',
                notificationDescription:
                    'reminder : Take 1 tablet of paracetamol every 6 hours',
                time: '5m ago',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
