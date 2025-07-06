import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healr/features/notification/data/models/medicine_model.dart';
import 'package:healr/features/notification/data/repo/medicine_repo.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  final MedicineRepo medicineRepo;
  List<MedicineModel> _medicines = [];
  Timer? timer;
  MedicineCubit(this.medicineRepo) : super(MedicineInitial());
  List<MedicineModel> get medicines => _medicines;
  Future<void> fetchMedicines() async {
    emit(MedicineLoading());

    final result = await medicineRepo.getMedicine();

    result.fold(
      (failure) => emit(MedicineFailure(failure.errMessage)),
      (data) {
        _medicines = data;
        if (data.isEmpty) {
          print("No medicines found");
          emit(MedicineEmpty());
        } else {
          emit(MedicineSuccess(data));
        }
      },
    );
  }

  void startPolling() {
    fetchMedicines();
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }

  Future<void> deleteOneMedicine(String medicineId) async {
  final result = await medicineRepo.deleteMedicine(medicineId);

  result.fold(
    (failure) {
      emit(MedicineFailure(failure.errMessage));
    },
    (_) {
      _medicines.removeWhere((med) => med.id == medicineId);
      emit(_medicines.isEmpty ? MedicineEmpty() : MedicineSuccess(_medicines));
    },
  );
}


  void markAllAsRead() {
    _medicines = _medicines.map((medicine) {
      return medicine.copyWith(isRead: true);
    }).toList();

    emit(MedicineSuccess(_medicines));
  }
}
