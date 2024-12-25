import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.onChanged,
    required this.obscureText,
    this.showForgotPass = false,
    this.onTap,
  });

  final String hintText, labelText;
  final Function(String)? onChanged;
  bool showPassword = true;
  final bool obscureText;
  final bool showForgotPass;
  final void Function()? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.showPassword = widget.obscureText;
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.showForgotPass
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.labelText,
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.h),
                      child: GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Forgot Password?',
                          style: Styles.textStyle14
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                )
              : Text(
                  widget.labelText,
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.h,
            ),
            child: Form(
              key: formKey,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                keyboardType: widget.labelText == 'National number' ||
                        widget.labelText == 'Phone number'
                    ? TextInputType.number
                    : TextInputType.text,
                obscureText: widget.showPassword,
                controller: controller,
                onChanged: widget.onChanged,
                cursorColor: kSecondaryColor.withOpacity(0.8),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 0.h,
                  ),
                  suffixIcon: widget.labelText == 'Password' ||
                          widget.labelText == 'Confirm password'
                      ? customPasswordIcon()
                      : null,
                  hintText: widget.hintText,
                  hintStyle: Styles.textStyle12.copyWith(
                    color: kHintColor.withOpacity(0.6),
                  ),
                  border: outlineInputBorder(
                    width: 1.w,
                    color: kHintColor.withOpacity(0.6),
                  ),
                  focusedBorder: outlineInputBorder(
                    width: 2.w,
                    color: kSecondaryColor.withOpacity(0.8),
                  ),
                  errorBorder: outlineInputBorder(
                    width: 2.w,
                    color: kErrorColor.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconButton customPasswordIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.showPassword = !widget.showPassword;
        });
      },
      icon: SvgPicture.asset(
        widget.showPassword
            ? 'assets/images/hide.svg'
            : 'assets/images/view.svg',
        height: 24.h,
        width: 24.w,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(
      {required Color color, required double width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }
}
