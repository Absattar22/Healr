import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healr/features/login/data/model/user_model.dart';
import 'package:healr/features/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginStateInitial());

  final LoginRepo loginRepo;

  Future<void> loginUser(String nationalID, String password) async {
  emit(LoginLoading());

  var result = await loginRepo.loginUser(nationalID, password);

  result.fold(
    (failure) {
      emit(LoginFailure(failure.errMessage));
    },
    (user) {
      emit(LoginSuccess(user));
    },
  );
}

}
