import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/login/data/repos/login_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImp>(
    LoginRepoImp(getIt.get<ApiService>(),),
  );

}