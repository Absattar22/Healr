import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/sign_up/data/repos/signup_repo_implement.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  getIt.registerSingleton<SignUpRepoImplement>(
    SignUpRepoImplement(getIt.get<ApiService>()),
  );
}
