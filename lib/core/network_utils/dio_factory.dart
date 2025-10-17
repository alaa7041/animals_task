import 'package:animals_task/features/home/presentation/screens/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../caching_utils/shared_prefernce_helper.dart';
import '../helpers/constants.dart';
import '../routing/route_manager.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static bool _withToken = true;

  static Future<Dio> getDio() async {
    Duration timeout = const Duration(seconds: 25);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout
        ..options.sendTimeout = timeout;
      await addDioHeaders();
      addDioInterceptors();

      return dio!;
    }
    return dio!;
  }

  static void enableToken() => _withToken = true;
  static void disableToken() => _withToken = false;

  static void setTokenAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static Future<void> addDioHeaders() async {
    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefsKeys.userToken,
    );
    debugPrint("🔐 Header token loaded: $token");
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void clearToken() {
    dio?.options.headers.remove('Authorization');
  }

  static void addDioInterceptors() {
    // Auth interceptor for handling 401 responses
    dio?.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) async {
          final statusCode = error.response?.statusCode;
          final message = error.response?.data is Map
              ? (error.response?.data['message']?.toString().toLowerCase() ??
                  '')
              : '';

          if (statusCode == 401 && message.contains('unauthenticated')) {
            await SharedPrefHelper.clearAllData();
            await SharedPrefHelper.clearAllSecuredData();
            await SharedPrefHelper.setData(
                SharedPrefsKeys.notShowOnboarding, true);
            // Navigate to splash screen (beginning of the app)
            RouteManager.navigateAndPopAll(HomeScreen());
            return handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                response: error.response,
                error: 'Session expired, please login again',
                type: DioExceptionType.badResponse,
              ),
            );
          }

          return handler.next(error);
        },
      ),
    );

    // Pretty logger
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Accept-Language'] = currentLanguage;
          final requiresAuth = options.extra['auth'] != false; // default: true
          if (requiresAuth) {
            final token = await SharedPrefHelper.getToken();
            if (token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          } else {
            // auth: false → نشيل الهيدر
            options.headers.remove('Authorization');
          }
          return handler.next(options);
        },
      ),
    );

    // Pretty logger (for debugging)
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );
  }
}
