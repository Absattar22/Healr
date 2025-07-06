import 'package:dartz/dartz.dart';
import 'package:healr/core/errors/failure.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/notification/data/models/medicine_model.dart';
import 'package:healr/features/notification/data/repo/medicine_repo.dart';
import 'package:healr/features/notification/ui/views/widgets/local_notification.dart';

class MedicineRepoImp implements MedicineRepo {
  final ApiService apiService;
  MedicineRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<MedicineModel>>> getMedicine() async {
    try {
      final response = await apiService.get(
        endPoint: 'medicine/getMyMedicine',
      );

      if (response.containsKey('status') && response['status'] == 'error') {
        return Left(ServerFailure(response['message']));
      }

      final List<dynamic> data = response['data'];
      final List<MedicineModel> medicineList =
          data.map((e) => MedicineModel.fromJson(e)).toList();

      return Right(medicineList);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('⚠️ Unexpected error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMedicine(String medicineId) async {
    try {
      final response = await apiService.delete(
        endPoint: 'medicine/delete/$medicineId',
      );

      if (response.containsKey('status') && response['status'] == 'error') {
        return Left(ServerFailure(response['message']));
      }
      return const Right(null);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure('⚠️ Unexpected error occurred: $e'));
    }
  }
}
