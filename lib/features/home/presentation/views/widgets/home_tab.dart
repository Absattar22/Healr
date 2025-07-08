import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/home/presentation/views/widgets/custom_row.dart';
import 'package:healr/features/home/presentation/views/widgets/health_insurance_section.dart';
import 'package:healr/features/home/presentation/views/widgets/home_header_section.dart';
import 'package:healr/features/home/presentation/views/widgets/services_section.dart';
import 'package:healr/features/home/presentation/views/widgets/waiting_people_section.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

PersistentTabConfig homeTab() {
  return PersistentTabConfig(
    screen: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24.h,
              ),
            ),
            const SliverToBoxAdapter(
              child: HomeHeaderSection(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24.h,
              ),
            ),
            const SliverToBoxAdapter(
              child: WaitingPeopleSection(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            const SliverToBoxAdapter(
              child: HealthInsuranceSection(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "What would you like to do?",
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(
                    0xff1A1A1A,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            const SliverToBoxAdapter(
              child: ServicesSection(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Explore more services",
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1A1A1A),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 8.h,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomRow(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 8.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Builder(
                builder: (context) => viewMore(context),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
          ],
        ),
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

Widget viewMore(BuildContext context) {
  return GestureDetector(
    onTap: () {
      GoRouter.of(context).push(AppRouter.kSearchview);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "View More",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xff3A95D2),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 20.w,
          color: const Color(0xff3A95D2),
        ),
      ],
    ),
  );
}
