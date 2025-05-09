import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/profile/presentation/views/widgets/custom_app_bar.dart';
import 'package:healr/features/profile/presentation/views/widgets/health_insurance_text_field.dart';

class HealthInsuranceViewBody extends StatelessWidget {
  const HealthInsuranceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAppBar(text: 'Health Insurance'),
              SizedBox(height: 16.h),
              Image.asset(
                'assets/images/insurance.png',
                width: 80.w,
                height: 70.h,
              ),
              SizedBox(height: 16.h),
              Text(
                textAlign: TextAlign.center,
                'You’re signed into the General Authority for Health Insurance in Egypt!',
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff3A95D2),
                ),
              ),
              SizedBox(height: 32.h),
              const HealthInsuranceTextField(
                hintText: 'Mahmoud Mohamed Hamada Hemeda',
                text: 'Head of the family',
              ),
              SizedBox(height: 16.h),
              const HealthInsuranceTextField(
                hintText: 'Ahmed Mahmoud Mohamed Hamada',
                text: 'Beneficiary name',
              ),
              SizedBox(height: 16.h),
              const HealthInsuranceTextField(
                hintText: 'El-Rahma',
                text: 'Health unit',
              ),
              SizedBox(height: 16.h),
              const HealthInsuranceTextField(
                hintText: '5607-23',
                text: 'File number',
              ),
              SizedBox(height: 16.h),
              const HealthInsuranceTextField(
                hintText: '583947629385324',
                text: 'National number',
              ),
              SizedBox(height: 48.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Validity Status',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff1A1A1A),
                    ),
                  ),
                  Container(
                    width: 172.w,
                    height: 42.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: const Color(0xff3A95D2),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'Active',
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff3A95D2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
