import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/utils/shared_pref_cache.dart';
import 'package:healr/core/widgets/custom_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              text: "logout",
              onPressed: () {
                SharedPrefCache.removeCache(key: 'token');
                GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
              }),
          SizedBox(height: 20.h),
          CustomButton(
              text: "Chatbot",
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kChatbotView);
              }),
        ],
      ),
    );
  }
}
