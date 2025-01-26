import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_button.dart';
import 'package:healr/core/widgets/custom_text_field.dart';
import 'package:healr/features/login/presentation/views/widgets/custom_back_button.dart';
import 'package:healr/features/login/presentation/views/widgets/custom_password_validation_sentence.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomBackButton(),
            SizedBox(height: 32.h),
            Text(
              "Create new password",
              textAlign: TextAlign.center,
              style: Styles.textStyle32.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomTextField(
                hintText: "•••••••••••••••",
                labelText: "Password",
                obscureText: true),
            SizedBox(height: 16.h),
            const CustomPasswordValidtionSentence(
              icon: Icons.close,
              text: "Password should be at least 8 characters long ",
            ),
            SizedBox(height: 12.h),
            const CustomPasswordValidtionSentence(
              icon: Icons.check,
              text: "Include one uppercase letter",
            ),
            SizedBox(height: 12.h),
            const CustomPasswordValidtionSentence(
              icon: Icons.check,
              text: "Add a number and a special character ‘’**",
            ),
            SizedBox(height: 24.h),
            CustomTextField(
                hintText: "•••••••••••••••",
                labelText: "Confirm password",
                obscureText: true),
            SizedBox(height: 24.h),
            CustomButton(
                text: "Reset password",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kPasswordChangedView);
                }),
          ],
        ),
      ),
    )));
  }
}
