import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/presentation/views/widgets/book2_header.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_info.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_stat_item.dart';
import 'package:healr/features/home/presentation/views/widgets/doctor_stats.dart';

class BookAppoint2ViewBody extends StatelessWidget {
  const BookAppoint2ViewBody({super.key, this.data});
  final List<Datum>? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Book2Header(),
            SizedBox(height: 24.h),
            DoctorInfo(data: data),
            SizedBox(
              height: 28.h,
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffCCCCCC),
            ),
            SizedBox(height: 16.h),
            DoctorStats(
              data: data,
            )
          ],
        ),
      ),
    );
  }
}
