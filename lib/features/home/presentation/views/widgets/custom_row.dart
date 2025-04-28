import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/features/home/presentation/views/widgets/custom_container.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: CustomContainer(
            imgUrl: 'assets/images/video.svg',
            title: 'Video Visit',
          ),
        ),
        SizedBox(width: 8.w),
        const Expanded(
          child: CustomContainer(
            imgUrl: 'assets/images/robot.svg',
            title: 'Ent Care',
          ),
        ),
        SizedBox(width: 8.w),
        const Expanded(
          child: CustomContainer(
            imgUrl: 'assets/images/blood.svg',
            title: 'Blood Donation',
          ),
        ),
        SizedBox(width: 8.w),
        const Expanded(
          child: CustomContainer(
            imgUrl: 'assets/images/dental.svg',
            title: 'Dental Care',
          ),
        ),
      ],
    );
  }
}
