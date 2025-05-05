import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/styles.dart';

class CustomNotificationAppBar extends StatelessWidget {
  const CustomNotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notifications',
            style: Styles.textStyle32.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xff1A1A1A),
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }
}
