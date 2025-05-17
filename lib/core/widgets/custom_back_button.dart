import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/constants.dart';

class CustomBackButton extends StatelessWidget {
  final double? marginLeft;
  const CustomBackButton({
    super.key,
    this.marginLeft = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.only(left: marginLeft!.w),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: const Color(0xffF2F2F2).withAlpha(100),
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: SvgPicture.asset(
              "assets/images/arrow_back_icon.svg",
              width: 7.5.w,
              height: 15.h,
              colorFilter: ColorFilter.mode(
                kSecondaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
