import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_button.dart';
import 'package:healr/features/login/presentation/views/widgets/custom_sign_in_with_email_button.dart';
import 'package:healr/core/widgets/custom_text_field.dart';
import 'package:healr/core/widgets/custom_text_rich.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 88.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Sign in',
                  style: Styles.textStyle32.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 60.h),
                CustomTextField(
                  labelText: 'National number',
                  hintText: 'Enter your 14-digit national number',
                  onChanged: (value) {},
                  obscureText: false,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  labelText: 'Password',
                  hintText: '•••••••••••••••',
                  onChanged: (value) {},
                  obscureText: true,
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: 'Sign in',
                  onPressed: () {},
                ),
                SizedBox(height: 16.h),
                SvgPicture.asset(
                  'assets/images/or.svg',
                  height: 20.h,
                  width: 20.w,
                ),
                SizedBox(height: 16.h),
                CustomSignInWithEmailButton(
                  onTap: () {},
                ),
                SizedBox(height: 16.h),
                Center(
                  child: CustomTextRich(
                    text1: 'New Here?',
                    text2: '  Create an Account',
                    onTapText2: () {
                      GoRouter.of(context).push(AppRouter.kSignUpView);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
