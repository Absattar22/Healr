import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/core/widgets/custom_button.dart';
import 'package:healr/core/widgets/custom_text_field.dart';
import 'package:healr/features/notification/data/models/medicine_model.dart';
import 'package:healr/features/notification/ui/views/widgets/custom_medicine_container.dart';
import 'package:healr/features/profile/presentation/views/widgets/custom_app_bar.dart';
import 'package:hugeicons/hugeicons.dart';

class MedicineViewBody extends StatelessWidget {
  const MedicineViewBody({super.key, required this.med});
  final List<MedicineModel> med;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: const CustomAppBar(text: 'Prescription'),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          radius: 30.r,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Image.asset(
                              'assets/images/female.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr ${med[0].doctorName}',
                              style: Styles.textStyle18.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff1A1A1A),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Added a new prescription',
                              style: Styles.textStyle18.copyWith(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff666666),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Medicine Details',
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff666666),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
            SliverList.separated(
              itemCount: med.length,
              itemBuilder: (context, index) {
                return CustomMedicineContainer(
                  medicineName: med[index].name,
                  dosage: med[index].dosage,
                  numberOfTimes: med[index].numberOfTimes,
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouter.kMedicineDetailsView, extra: med);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff3A95D2),
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          HugeIcons.strokeRoundedMedicine02,
                          color: const Color(0xff3A95D2),
                          size: 32.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Add Reminder for Medicines',
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff3A95D2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                maxLength: 200,
                maxLines: 5,
                hintText: 'Add Prescription Notes ',
                labelText: 'Prescription Notes',
                readOnly: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
                child: CustomButton(
                  text: 'Save',
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
