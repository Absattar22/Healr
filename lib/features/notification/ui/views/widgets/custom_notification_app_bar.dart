import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/notification/ui/manager/notificationActionCubit/notification_actions_cubit.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pull_down_button/pull_down_button.dart';

class CustomNotificationAppBar extends StatefulWidget {
  const CustomNotificationAppBar({super.key, this.isNotificationfound = false});
  final bool isNotificationfound;
  @override
  State<CustomNotificationAppBar> createState() =>
      _CustomNotificationAppBarState();
}

class _CustomNotificationAppBarState extends State<CustomNotificationAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          top: 24.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Notifications',
              style: Styles.textStyle32.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xff1A1A1A),
              ),
            ),
            widget.isNotificationfound
                ? PullDownButton(
                    itemBuilder: (context) => [
                      PullDownMenuItem(
                        title: 'Select',
                        subtitle: 'Select any notifications',
                        onTap: () {
                          setState(() {
                            context
                                .read<NotificationActionsCubit>()
                                .selecting();
                          });
                        },
                        icon: HugeIcons.strokeRoundedCheckmarkCircle02,
                      ),
                      PullDownMenuItem(
                        title: 'Delete Selected',
                        isDestructive: true,
                        icon: HugeIcons.strokeRoundedDelete02,
                        iconColor: const Color(0xffD80000),
                        onTap: () {
                          final cubit =
                              context.read<NotificationActionsCubit>();
                          final selected = cubit.selectedIds;

                          if (selected.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      'Please select a notification to delete.')),
                            );
                          } else if (selected.length > 1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please select only one notification to delete.')),
                            );
                          } else {
                            CircularProgressIndicator(
                              color: kSecondaryColor,
                            );
                            cubit.deleteSingleNotification(
                                context, selected.first);
                          }
                        },
                      ),
                    ],
                    buttonBuilder: (context, showMenu) => IconButton(
                      onPressed: showMenu,
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        color: Color(0xff1A1A1A),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
