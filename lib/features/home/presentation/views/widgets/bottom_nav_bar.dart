import 'package:flutter/material.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/features/home/presentation/views/widgets/tabs_list.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) => PersistentTabView(
        navBarOverlap: const NavBarOverlap.none(),
        gestureNavigationEnabled: true,
        backgroundColor: kPrimaryColor,
        tabs: tabs(),
        navBarBuilder: (navBarConfig) => Style15BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: const NavBarDecoration(
            color: Colors.white,
          ),
        ),
      );
}
