import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_availabled.dart';
import 'package:healr/core/widgets/custom_book_button.dart';
import 'package:healr/core/widgets/custom_doctor_image.dart';
import 'package:healr/core/widgets/custom_professional_doctor.dart';
import 'package:healr/core/widgets/custom_rating.dart';

class DoctorCard extends StatelessWidget {
  final String? doctorImg;
  final String? doctorName;
  final String? doctorSpecialty;
  final double? rating;
  final void Function()? onPressed;
  const DoctorCard(
      {super.key,
      this.doctorImg,
      this.rating,
      this.doctorName,
      this.doctorSpecialty,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5.w,
          color: const Color(0xffCCCCCC),
        ),
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDoctorImage(doctorImg: doctorImg),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomProfessionalDoctor(),
                  SizedBox(height: 4.h),
                  Text(doctorName ?? "",
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 4.h),
                  Text(
                    doctorSpecialty ?? "",
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff666666),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  CustomRating(
                    rating: rating,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SvgPicture.asset("assets/images/location-06.svg"),
              SizedBox(width: 4.w),
              Text("Ismailia, SCU Hospital",
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SvgPicture.asset("assets/images/dollar-circle.svg"),
              SizedBox(width: 4.w),
              Text("Appointment price: 300 L.E.",
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              const CustomAvailable(),
              SizedBox(width: 12.w),
              CustomBookButton(onPressed: onPressed),
            ],
          )
        ],
      ),
    );
  }
}
