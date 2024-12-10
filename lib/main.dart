import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/app_router.dart';

void main() {
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
