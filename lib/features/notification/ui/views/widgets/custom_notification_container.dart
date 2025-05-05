import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/notification/ui/views/widgets/custom_medicine_button.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomNotificationContainer extends StatefulWidget {
  const CustomNotificationContainer(
      {super.key,
      required this.img,
      required this.notificationTitle,
      required this.notificationDescription,
      required this.time,
      this.isMedicine = false});
  final String img;
  final String notificationTitle;
  final String notificationDescription;
  final String time;
  final bool isMedicine;

  @override
  State<CustomNotificationContainer> createState() =>
      _CustomNotificationContainerState();
}

class _CustomNotificationContainerState
    extends State<CustomNotificationContainer> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffE7F3FF),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 25, 25, 236).withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    child: SvgPicture.asset(
                      widget.img,
                      width: 40.w,
                      height: 40.h,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                widget.notificationTitle,
                                style: Styles.textStyle18.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff1A1A1A),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              widget.time,
                              style: Styles.textStyle12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff666666),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          widget.notificationDescription,
                          style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff1A1A1A).withOpacity(0.7),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        if (isClicked && widget.isMedicine)
                          Row(
                            children: [
                              CustomMedicineButton(
                                buttonStyle: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff3A95D2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                onPressed: () {},
                                color: const Color(0xffF8F8F8),
                                icon: HugeIcons.strokeRoundedTick01,
                                text: 'Taken',
                                textStyle: Styles.textStyle16.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xffF8F8F8),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              CustomMedicineButton(
                                buttonStyle: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: const Color(0xffF8F8F8),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Color(0xff3A95D2),
                                    ),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                onPressed: () {},
                                color: const Color(0xff3A95D2),
                                icon: HugeIcons.strokeRoundedCancel01,
                                text: 'Skipped',
                                textStyle: Styles.textStyle16.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff3A95D2),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
