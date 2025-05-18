import 'package:flutter/material.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_back_button.dart';

class Book2Header extends StatelessWidget {
  const Book2Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomBackButton(
          marginLeft: 0,
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.15),
        Text(
          "Book appointment",
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
