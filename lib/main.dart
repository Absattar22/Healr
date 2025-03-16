import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/app_router.dart';
import 'package:healr/core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const Healr());
}

class Healr extends StatelessWidget {
  const Healr({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kSecondaryColor,
              selectionHandleColor: kSecondaryColor,
              selectionColor: kSecondaryColor.withAlpha(100),
            ),
            textTheme: ThemeData.light().textTheme.apply(
                  fontFamily: 'Aspekta',
                ),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
