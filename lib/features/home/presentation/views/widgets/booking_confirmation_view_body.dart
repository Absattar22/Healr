import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_back_button.dart';
import 'package:healr/features/home/data/models/all_doctors_model/datum.dart';
import 'package:healr/features/home/presentation/views/widgets/appoint_details_container.dart';

class BookingConfirmationViewBody extends StatelessWidget {
  const BookingConfirmationViewBody({super.key, this.data});
  final Datum? data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () {
        GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CustomBackButton(
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
            },
          ),
          title: Text(
            "Back to Home",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 62.h,
              ),
              SvgPicture.asset(
                "assets/images/green_check.svg",
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Appointment Confirmed",
                textAlign: TextAlign.center,
                style: Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                  "Your visit with ${data!.name} is scheduled for July 1, at 1:00 PM.",
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff666666),
                  )),
              SizedBox(
                height: 20.h,
              ),
              const AppointDetailsContainer(),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: Size(110.w, 40.h),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        side: BorderSide(
                          color: kSecondaryColor,
                          width: 1.w,
                        ),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .push(AppRouter.kAppointDetailsView, extra: data);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: Size(239.w, 40.h),
                      backgroundColor: kSecondaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide.none),
                    ),
                    child: Text(
                      "View Appointment Details",
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
