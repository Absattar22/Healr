import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:healr/features/home/presentation/views/home_view.dart';
import 'package:healr/features/login/presentation/views/forget_password_view.dart';
import 'package:healr/features/login/presentation/views/login_view.dart';
import 'package:healr/features/login/presentation/views/new_password_view.dart';
import 'package:healr/features/login/presentation/views/password_changed_view.dart';
import 'package:healr/features/login/presentation/views/verification_code_view.dart';
import 'package:healr/features/onborading/presentation/views/onboarding_view.dart';
import 'package:healr/features/onborading/splash_view.dart';
import 'package:healr/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:healr/home.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kOnboardingView = '/OnboardingView';
  static const kLoginView = '/LoginView';
  static const kSignUpView = '/SignUpView';
  static const kHomeView = '/HomeView';
  static const kForgetPasswordView = '/ForgetPasswordView';
  static const kVerificationCodeView = '/VerificationCodeView';
  static const kNewPasswordView = '/NewPasswordView';
  static const kPasswordChangedView = '/PasswordChangedView';
  static final router = GoRouter(
    initialLocation: kSplashView,
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnboardingView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardingView(),
          transitionsBuilder: customNavigateAnimation,
        ),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const Home(),
          transitionsBuilder: customNavigateAnimation,
        ),
      ),
      GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginView(),
          transitionsBuilder: customNavigateAnimation,
        ),
      ),
      GoRoute(
        path: kSignUpView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignUpView(),
          transitionsBuilder: customNavigateAnimation,
        ),
      ),
      GoRoute(
        path: kForgetPasswordView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ForgetPasswordView(),
          transitionsBuilder: customNavigateAnimation,
        ),
      ),
      GoRoute(
        path: kVerificationCodeView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const VerificationCodeView(),
          transitionsBuilder: customNavigateAnimation,
        ),
      ),
      GoRoute(
        path: kNewPasswordView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const NewPasswordView(),
          transitionsBuilder: customNavigateAnimation,
        ),
      ),
      GoRoute(
          path: kPasswordChangedView,
          pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const PasswordChangedView(),
                transitionsBuilder: customNavigateAnimation,
              )),
    ],
  );
}

Widget customNavigateAnimation(context, animation, secondaryAnimation, child) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  const curve = Curves.easeOut;

  final tween = Tween(begin: begin, end: end).chain(
    CurveTween(curve: curve),
  );
  final offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}
