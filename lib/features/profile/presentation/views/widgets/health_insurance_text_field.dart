import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/styles.dart';

class HealthInsuranceTextField extends StatelessWidget {
  const HealthInsuranceTextField(
      {super.key, required this.hintText, required this.text});

  final String hintText, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xff1A1A1A),
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              gapPadding: 10,
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: Color(0xffCCCCCC),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              gapPadding: 10,
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: Color(0xffCCCCCC),
                width: 1,
              ),
            ),
            hintText: hintText,
            hintStyle: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff666666),
            ),
          ),
        )
      ],
    );
  }
}
