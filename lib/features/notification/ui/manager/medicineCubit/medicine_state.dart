part of 'medicine_cubit.dart';

sealed class MedicineState extends Equatable {
  const MedicineState();

  @override
  List<Object> get props => [];
}

final class MedicineInitial extends MedicineState {}
final class MedicineLoading extends MedicineState {}
class MedicineSuccess extends MedicineState {
  final List<MedicineModel> medicines;

  const MedicineSuccess(this.medicines);
}

class MedicineFailure extends MedicineState {
  final String message;

  const MedicineFailure(this.message);
}
class MedicineEmpty extends MedicineState {}