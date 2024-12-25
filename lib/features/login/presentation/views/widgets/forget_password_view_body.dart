import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_button.dart';
import 'package:healr/core/widgets/custom_text_field.dart';

import 'package:healr/features/login/presentation/views/widgets/custom_back_button.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomBackButton(),
              SizedBox(height: 32.h),
              Text(
                'Forgot your password?',
                textAlign: TextAlign.center,
                style: Styles.textStyle30.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Enter your Email account to reset your password",
                textAlign: TextAlign.center,
                style: Styles.textStyle14,
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                  hintText: "enter your Email",
                  labelText: "Email address",
                  obscureText: false),
              SizedBox(height: 24.h),
              CustomButton(text: "Next", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
