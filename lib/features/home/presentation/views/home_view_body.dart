import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/features/home/presentation/views/widgets/custom_row.dart';
import 'package:healr/features/home/presentation/views/widgets/health_insurance_section.dart';
import 'package:healr/features/home/presentation/views/widgets/home_header_section.dart';
import 'package:healr/features/home/presentation/views/widgets/services_section.dart';
import 'package:healr/features/home/presentation/views/widgets/waiting_people_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 24.h,
          ),
          child: Column(
            children: [
              const HomeHeaderSection(),
              SizedBox(height: 24.h),
              const WaitingPeopleSection(),
              SizedBox(height: 16.h),
              const HealthInsuranceSection(),
              SizedBox(height: 24.h),
              const ServicesSection(),
              SizedBox(height: 24.h),
              const CustomRow(),
            ],
          ),
        ),
      ),
    );
  }
}
