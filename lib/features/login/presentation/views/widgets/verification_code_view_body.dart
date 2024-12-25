import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_button.dart';
import 'package:healr/core/widgets/custom_text_rich.dart';
import 'package:healr/features/login/presentation/views/widgets/custom_back_button.dart';
import 'package:healr/features/login/presentation/views/widgets/custom_pinput.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeViewBody extends StatefulWidget {
  const VerificationCodeViewBody({super.key});

  @override
  State<VerificationCodeViewBody> createState() =>
      _VerificationCodeViewBodyState();
}

class _VerificationCodeViewBodyState extends State<VerificationCodeViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 32.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomBackButton(),
              SizedBox(height: 32.h),
              Text(
                'Enter verification code',
                textAlign: TextAlign.center,
                style: Styles.textStyle30.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "An OTP has been sent to your registered email address. Please enter the code below to proceed.",
                textAlign: TextAlign.center,
                style: Styles.textStyle14,
              ),
              SizedBox(height: 32.h),
              Text(
                "The OTP is valid for 10 minutes.",
                textAlign: TextAlign.center,
                style: Styles.textStyle14,
              ),
              SizedBox(height: 20.h),
              CustomPinPut(pinController: _pinController, formKey: formKey),
              SizedBox(height: 24.h),
              CustomButton(
                text: "verify",
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              Center(
                child: CustomTextRich(
                  text1: "Didn’t receive a code?  ",
                  text2: "Resend code",
                  onTapText2: () {},
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
