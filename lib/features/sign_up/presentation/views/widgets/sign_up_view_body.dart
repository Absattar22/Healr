import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_button.dart';
import 'package:healr/core/widgets/custom_text_field.dart';
import 'package:healr/core/widgets/custom_text_rich.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Create an account',
                style: Styles.textStyle32.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                hintText: "Enter your 14-digit national number.",
                labelText: "National number",
                obscureText: false,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                hintText: "eg. 0122222222",
                labelText: "Phone number",
                obscureText: false,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                hintText: "enter your email",
                labelText: "Email address",
                obscureText: false,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                hintText: "•••••••••••••••",
                labelText: "Password",
                obscureText: true,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                hintText: "•••••••••••••••",
                labelText: "Confirm password",
                obscureText: true,
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: "Sign up",
                onPressed: () {},
              ),
              SizedBox(height: 4.h),
              Center(
                child: CustomTextRich(
                  text1: "Already have an account? ",
                  text2: " Sign in",
                  onTapText2: () {
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
