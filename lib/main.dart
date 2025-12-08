import 'package:animal_app/animal_app.dart';
import 'package:animal_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  setupGeIt();
  runApp(AnimalApp(appRouter: AppRouter(),));
}

