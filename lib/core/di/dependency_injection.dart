import 'package:animals_task/core/network_utils/dio_factory.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network_utils/api_service.dart';
import '../network_utils/network_status_info.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();

  // Connectivity + NetworkStatus
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<NetworkStatusInfo>(
      () => NetworkStatusInfoImpl(getIt()));

  // ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Auth repo
  //getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt(), getIt()));


  //Cubits
  //getIt.registerFactory<SplashCubit>(() => SplashCubit());

}
