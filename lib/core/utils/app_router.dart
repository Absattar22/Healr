import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healr/features/login/presentation/views/forget_password_view.dart';
import 'package:healr/features/login/presentation/views/login_view.dart';
import 'package:healr/features/onborading/presentation/views/onboarding_view.dart';
import 'package:healr/features/sign_up/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static const kOnboarding = '/';
  static const kLoginView = '/LoginView';
  static const kSignUpView = '/SignUpView';
  static const kForgetPasswordView = '/ForgetPasswordView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kOnboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginView(),
          transitionsBuilder: navigateAnimation,
        ),
      ),
      GoRoute(
        path: kSignUpView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignUpView(),
          transitionsBuilder: navigateAnimation,
        ),
      ),
      GoRoute(
        path: kForgetPasswordView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ForgetPasswordView(),
          transitionsBuilder: navigateAnimation,
        ),
      ),
    ],
  );
}

Widget navigateAnimation(context, animation, secondaryAnimation, child) {
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
