import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healr/core/utils/service_locator.dart';
import 'package:healr/features/sign_up/data/repos/signup_repo_implement.dart';
import 'package:healr/features/sign_up/presentation/view_model/signup_cubit/signup_cubit.dart';
import 'package:healr/features/sign_up/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<SignUpRepoImplement>()),
      child: const SignUpViewBody(),
    );
  }
}
