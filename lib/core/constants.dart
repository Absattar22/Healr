import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

Color kPrimaryColor = const Color(0xffFCFCFF);
Color kSecondaryColor = const Color(0xFF2673A6);
Color kHintColor = const Color(0xff999999);
Color kErrorColor = const Color(0xFFFF0000);
Color kSignIconColor = const Color(0xff4D4D4D);

String? kToken;
String? kOnboardingStatus;
String? pendingSearchQuery; // Variable to store pending search queries
final PersistentTabController persistentController =
    PersistentTabController(initialIndex: 0);
