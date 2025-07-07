import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/features/home/presentation/views/widgets/custom_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomCard(
                imgUrl: 'assets/images/component1.svg',
                title: 'Book appointment',
                subtitle: 'Just a few taps to book your next appointment.',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookAppointView);
                },
              ),
            ),
            SizedBox(width: 8.w),
            const Expanded(
              child: CustomCard(
                imgUrl: 'assets/images/component2.svg',
                title: 'Test/scans results',
                subtitle: 'View your test results and scans instantly.',
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomCard(
                imgUrl: 'assets/images/component3.svg',
                title: 'My approvals',
                subtitle: 'Medication and tests approvals from insurance',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kApprovalsView);
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: CustomCard(
                imgUrl: 'assets/images/component4.svg',
                title: 'Our doctors',
                subtitle:
                    'Find doctors in various fields and book with just a few taps.',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kOurDoctorsView);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
