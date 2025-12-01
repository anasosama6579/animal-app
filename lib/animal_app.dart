import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/routes.dart';
import 'package:animal_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimalApp extends StatelessWidget {
  const AnimalApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Animal App',
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.loginScreen,
        theme: ThemeData(
          primaryColor: AppColors.primaryGreen,
          scaffoldBackgroundColor: AppColors.white,
        ),
      ),
    );
  }
}
