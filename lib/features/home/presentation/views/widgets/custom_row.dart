import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/features/home/presentation/views/widgets/custom_container.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'img': 'assets/images/bone.svg',
        'title': 'Orthopedics',
        'onTap': () {
          // Set the search query in constants
          pendingSearchQuery = "Orthopedics";
          // Jump to search tab
          persistentController.jumpToTab(1);
        },
      },
      {
        'img': 'assets/images/Pulmonology.svg',
        'title': 'Pulmonology',
        'onTap': () {
          pendingSearchQuery = "Pulmonology";
          persistentController.jumpToTab(1);
        },
      },
      {
        'img': 'assets/images/Dermatology.svg',
        'title': 'Dermatology',
        'onTap': () {
          pendingSearchQuery = "Dermatology";
          persistentController.jumpToTab(1);
        },
      },
      {
        'img': 'assets/images/dental.svg',
        'title': 'Dental Care',
        'onTap': () {
          pendingSearchQuery = "dental";
          persistentController.jumpToTab(1);
        },
      },
      {
        'img': 'assets/images/mental.svg',
        'title': 'Mental Health',
        'onTap': () {
          pendingSearchQuery = "Psychiatry";
          persistentController.jumpToTab(1);
        },
      },
      {
        'img': 'assets/images/eye.svg',
        'title': 'Eye Care',
        'onTap': () {
          pendingSearchQuery = "Ophthalmology";
          persistentController.jumpToTab(1);
        },
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
