import 'package:bloc/bloc.dart';
import 'package:healr/features/sign_up/data/repos/signup_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signUpRepo) : super(SignupInitial());
  SignUpRepo signUpRepo;
  Future<void> signUp({required Map<String, dynamic> data}) async {
    var response = await signUpRepo.signUp(data: data);
    return response.fold(
      (l) => emit(SignupFailed(message: l)),
      (r) => emit(SignupSuccess()),
    );
  }
}
