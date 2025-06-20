import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/home/presentation/views/widgets/appoint_day_item.dart';

class ChooseAppointDay extends StatelessWidget {
  const ChooseAppointDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Day",
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
            )),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 60.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const AppointDayItem(
                index: 0,
                text1: "Sun",
                text2: "1 Jul",
              ),
              SizedBox(width: 8.w),
              const AppointDayItem(
                index: 1,
                text1: "Mon",
                text2: "2 Jul",
              ),
              SizedBox(width: 8.w),
              const AppointDayItem(
                index: 2,
                text1: "Tue",
                text2: "3 Jul",
              ),
              SizedBox(width: 8.w),
              const AppointDayItem(
                index: 3,
                text1: "Wed",
                text2: "4 Jul",
              ),
              SizedBox(width: 8.w),
              const AppointDayItem(
                index: 4,
                text1: "Thu",
                text2: "5 Jul",
              ),
              SizedBox(width: 8.w),
              const AppointDayItem(
                index: 5,
                text1: "Fri",
                text2: "6 Jul",
              ),
              SizedBox(width: 8.w),
              const AppointDayItem(
                index: 6,
                text1: "Sat",
                text2: "7 Jul",
              ),
              SizedBox(width: 8.w),
              const AppointDayItem(
                index: 7,
                text1: "Sun",
                text2: "8 Jul",
              ),
              SizedBox(width: 8.w),
              const AppointDayItem(
                index: 8,
                text1: "Mon",
                text2: "9 Jul",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
