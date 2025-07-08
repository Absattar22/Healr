import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/features/home/presentation/views/widgets/tabs_list.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) => PersistentTabView(
        screenTransitionAnimation: const ScreenTransitionAnimation(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 10),
        ),
        controller: persistentController,
        gestureNavigationEnabled: true,
        backgroundColor: kPrimaryColor,
        tabs: tabs(),
        navBarBuilder: (navBarConfig) => Style15BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: kPrimaryColor,
          ),
        ),
        popAllScreensOnTapAnyTabs: true,
        popAllScreensOnTapOfSelectedTab: false,
        margin: EdgeInsets.only(
          top: 8.h,
        ),
      );
}
