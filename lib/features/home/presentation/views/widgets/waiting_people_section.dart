import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healr/core/utils/custom_text_span.dart';
import 'package:healr/core/utils/styles.dart';

class WaitingPeopleSection extends StatelessWidget {
  const WaitingPeopleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(28),
      dashPattern: const [16, 16],
      strokeWidth: 1,
      color: const Color(0xff1C567D),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ahead of you in line:',
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '5 people waiting',
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomTextSpan(
                    text1: 'The waiting time for your appointment\n is about ',
                    text2: 'one hour.',
                    text1Style: Styles.textStyle12.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    text2Style: Styles.textStyle12.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/images/waiting_person.svg',
              height: 100.h,
              width: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
