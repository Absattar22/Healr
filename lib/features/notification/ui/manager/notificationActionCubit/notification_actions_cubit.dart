import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healr/features/notification/data/models/medicine_model.dart';
import 'package:healr/features/notification/ui/manager/medicineCubit/medicine_cubit.dart';

part 'notification_actions_state.dart';

class NotificationActionsCubit extends Cubit<NotificationActionsState> {
  NotificationActionsCubit() : super(NotificationActionsInitial());

  final List<String> selectedIds = [];
  List<MedicineModel> localNotifications = [];

  void setNotifications(List<MedicineModel> notifications) {
    localNotifications = notifications;
    emit(IdleNotification());
  }

  void selecting() {
    emit(SelectingNotification());
  }

  void toggleSelection(String id) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    emit(SelectingNotification());
  }

  void deleteSingleNotification(BuildContext context, String id) async {
  final medicineCubit = context.read<MedicineCubit>();
  await medicineCubit.deleteOneMedicine(id);
  selectedIds.remove(id);
  emit(DeletingNotifications());
}


  void markAllAsRead(BuildContext context) {
    final medicineCubit = context.read<MedicineCubit>();
    medicineCubit.markAllAsRead();
    emit(MarkAllNotificationsAsReading());
  }
}
