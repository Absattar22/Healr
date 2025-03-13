import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healr/core/utils/styles.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              'Mohammed Mahmoud',
              style: Styles.textStyle22.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SvgPicture.asset(
          'assets/images/home_logo.svg',
        )
      ],
    );
  }
}
