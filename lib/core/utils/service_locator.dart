import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:healr/core/utils/api_service.dart';
import 'package:healr/features/login/data/repos/login_repo_imp.dart';
import 'package:healr/features/profile/data/repo/profile_repo_imp.dart';
import 'package:healr/features/sign_up/data/repos/sign_up_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImp>(
    LoginRepoImp(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SignUpRepoImp>(
    SignUpRepoImp(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ProfileRepoImp>(
    ProfileRepoImp(
      getIt.get<ApiService>(),
    ),
  );
}
