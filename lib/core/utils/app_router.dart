import 'package:go_router/go_router.dart';
import 'package:healr/features/onborading/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const kHomeView = '/LoginView';
  static const kOnboarding = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kOnboarding,
        builder: (context, state) => const OnboardingView(),
      ),
    ],
  );
}
