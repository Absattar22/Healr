import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomMedicineButton extends StatelessWidget {
  const CustomMedicineButton({
    super.key,
    required this.buttonStyle,
    required this.onPressed,
    required this.color,
    required this.icon,
    required this.text,
    required this.textStyle,
  });

  final ButtonStyle? buttonStyle;
  final void Function()? onPressed;
  final Color color;
  final IconData icon;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
        child: Row(
          children: [
            HugeIcon(
              icon: icon,
              color: color,
              size: 28.w,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(text, style: textStyle),
          ],
        ),
      ),
    );
  }
}
