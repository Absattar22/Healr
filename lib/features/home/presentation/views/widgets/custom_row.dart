import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/features/home/presentation/views/widgets/custom_container.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'img': 'assets/images/ent.svg',
        'title': 'ENT Care',
        'onTap': () {
          // دا هيكون فيه Navigation لصفحة ال ENT Care
        },
      },
      {
        'img': 'assets/images/Pulmonology.svg',
        'title': 'Pulmonology',
        'onTap': () {},
      },
      {
        'img': 'assets/images/Dermatology.svg',
        'title': 'Dermatology',
        'onTap': () {},
      },
      {
        'img': 'assets/images/dental.svg',
        'title': 'Dental Care',
        'onTap': () {},
      },
      {
        'img': 'assets/images/mental.svg',
        'title': 'Mental Health',
        'onTap': () {},
      },
      {
        'img': 'assets/images/eye.svg',
        'title': 'Eye Care',
        'onTap': () {},
      },
    ];

    return GridView.builder(
      padding: EdgeInsets.only(top: 8.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 1.4,
      ),
      itemCount: data.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = data[index];
        return CustomContainer(
          imgUrl: item['img'],
          title: item['title'],
          onTap: item['onTap'],
        );
      },
    );
  }
}
