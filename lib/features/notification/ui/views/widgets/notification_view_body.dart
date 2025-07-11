import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/date_format.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/notification/ui/manager/medicineCubit/medicine_cubit.dart';
import 'package:healr/features/notification/ui/manager/notificationActionCubit/notification_actions_cubit.dart';
import 'package:healr/features/notification/ui/views/no_notification_view.dart';
import 'package:healr/features/notification/ui/views/widgets/custom_notification_app_bar.dart';
import 'package:healr/features/notification/ui/views/widgets/custom_notification_container.dart';
import 'package:healr/features/notification/ui/views/widgets/notification_container_skeletonizer.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  bool isRefreshing = false;
  @override
  void initState() {
    super.initState();
    final cubit = context.read<MedicineCubit>();
    if (cubit.state is! MedicineSuccess && cubit.state is! MedicineEmpty) {
      cubit.startPolling();
    }
  }

  Future<void> _handleRefresh() async {
    setState(() => isRefreshing = true);
    await context.read<MedicineCubit>().fetchMedicines();
    setState(() => isRefreshing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NotificationActionsCubit, NotificationActionsState>(
        builder: (context, notificationState) {
          final isSelectMode = notificationState is SelectingNotification;

          return BlocBuilder<MedicineCubit, MedicineState>(
            builder: (context, state) {
              return LiquidPullToRefresh(
                onRefresh: _handleRefresh,
                height: 100.h,
                color: kSecondaryColor,
                backgroundColor: Colors.white,
                animSpeedFactor: 5,
                showChildOpacityTransition: false,
                child: Builder(
                  builder: (context) {
                    if (state is MedicineEmpty) {
                      return const NoNotificationView();
                    }
                    if (state is MedicineSuccess) {
                      final grouped = groupMedicinesByDate(state.medicines);

                      return CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.only(top: 16.h),
                            sliver: const SliverToBoxAdapter(
                              child: CustomNotificationAppBar(
                                isNotificationfound: true,
                              ),
                            ),
                          ),
                          for (final entry in grouped.entries) ...[
                            SliverPadding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 16.h),
                              sliver: SliverToBoxAdapter(
                                child: Text(
                                  entry.key,
                                  style: Styles.textStyle16.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff666666),
                                  ),
                                ),
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final med = entry.value[index];
                                  return CustomNotificationContainer(
                                    medicinesList: entry.value,
                                    img: 'assets/images/medicine.png',
                                    notificationTitle: 'New Medicine Added',
                                    notificationDescription:
                                        'Dr ${med.doctorName} added  a new medicine prescription tap to view details',
                                    time: med.formattedCreationTime,
                                    isButtonClicked: isSelectMode,
                                    ispopCLicked: isSelectMode,
                                    id: med.id,
                                  );
                                },
                                childCount: entry.value.length,
                              ),
                            ),
                          ],
                        ],
                      );
                    }

                    if (state is MedicineLoading) {
                      if (isRefreshing) {
                        return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return const NotificationContainerSkeletonizer();
                          },
                        );
                      }
                      return ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const NotificationContainerSkeletonizer();
                        },
                      );
                    }

                    if (state is MedicineFailure) {
                      return Center(
                        child: Text(
                          state.message,
                          style: Styles.textStyle16.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      );
                    }

                    return const Center(child: Text("No data yet"));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
