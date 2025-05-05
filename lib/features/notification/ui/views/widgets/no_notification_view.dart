import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/notification/ui/views/widgets/custom_notification_app_bar.dart';

class NoNotificationView extends StatelessWidget {
  const NoNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: SafeArea(
        child: Column(
          children: [
            const CustomNotificationAppBar(),
            const Spacer(flex: 1),
            SvgPicture.asset(
              'assets/images/no_notification.svg',
              width: 205.w,
              height: 205.h,
            ),
            SizedBox(height: 16.h),
            Text(
              'No new notifications right now.',
              style: Styles.textStyle20.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xff1A1A1A),
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Text(
                textAlign: TextAlign.center,
                'You’re all caught up! We’ll notify you when there’s something new.',
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff666666),
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
