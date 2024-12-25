import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
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
            margin: EdgeInsets.only(left: 20.w),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(width: 1.w, color: const Color(0xffCCCCCC)),
            ),
            child: SvgPicture.asset(
              "assets/images/arrow_back_icon.svg",
              width: 7.5.w,
              height: 15.h,
              colorFilter: const ColorFilter.mode(
                Color(0xff133953),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
