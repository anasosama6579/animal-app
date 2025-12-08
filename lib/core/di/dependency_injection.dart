
import 'package:animal_app/core/networking/dio_factory.dart';
import 'package:animal_app/features/signup/data/repos/signup_repo.dart';
import 'package:animal_app/features/signup/logic/signup/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../networking/api_services.dart';
final getIt  = GetIt.instance;
Future<void> setupGeIt() async {

  // Core Services
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // Login Feature
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiServices>()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // signup feature
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt<ApiServices>()),);
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepo>()),);


}