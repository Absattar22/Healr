import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/features/login/presentation/views/login_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

PersistentTabConfig searchTab() {
  return PersistentTabConfig(
    screen: const LoginView(),
    item: ItemConfig(
      activeForegroundColor: const Color(0xff3A95D2),
      inactiveForegroundColor: kHintColor,
      icon: SvgPicture.asset(
        "assets/images/search-1.svg",
        width: 32,
        height: 32,
      ),
      inactiveIcon: SvgPicture.asset(
        "assets/images/search.svg",
        width: 32,
        height: 32,
      ),
      title: "Search",
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
