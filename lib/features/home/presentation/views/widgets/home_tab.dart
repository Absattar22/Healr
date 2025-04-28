import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/home/presentation/views/widgets/custom_row.dart';
import 'package:healr/features/home/presentation/views/widgets/health_insurance_section.dart';
import 'package:healr/features/home/presentation/views/widgets/home_header_section.dart';
import 'package:healr/features/home/presentation/views/widgets/services_section.dart';
import 'package:healr/features/home/presentation/views/widgets/waiting_people_section.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

PersistentTabConfig homeTab() {
  return PersistentTabConfig(
    screen: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 24.h,
      ),
      child: Column(
        children: [
          const HomeHeaderSection(),
          SizedBox(height: 24.h),
          const WaitingPeopleSection(),
          SizedBox(height: 16.h),
          const HealthInsuranceSection(),
          SizedBox(height: 24.h),
          const ServicesSection(),
          SizedBox(height: 24.h),
          const CustomRow(),
        ],
      ),
    ),
    item: ItemConfig(
      activeForegroundColor: const Color(0xff3A95D2),
      inactiveForegroundColor: kHintColor,
      icon: SvgPicture.asset(
        "assets/images/home-1.svg",
        width: 32.w,
        height: 32.h,
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/images/home.svg",
        width: 32.w,
        height: 32.h,
      ),
      title: "Home",
      textStyle: Styles.textStyle12.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
