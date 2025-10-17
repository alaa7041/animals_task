import '../../../../core/network_utils/api_error_handler.dart';
import '../../../../core/network_utils/api_error_model.dart';
import '../../../../core/network_utils/api_result.dart';
import '../../../../core/network_utils/api_service.dart';
import '../../../../core/network_utils/network_status_info.dart';
import '../../../../core/network_utils/network_utils.dart';
import '../models/breeds_model.dart';

class BreedsRepo {
  final ApiService _apiService;
  final NetworkStatusInfo _networkStatusInfo;

  BreedsRepo(this._apiService, this._networkStatusInfo);
  Future<ApiResult<T>> _safeRequest<T>(
    Future<T> Function() request, {
    bool checkNet = true,
    Options? options,
  }) async {
    if (checkNet && !await _networkStatusInfo.isConnected) {
      return ApiResult.error(
        ApiErrorModel(message: "No internet connection"),
      );
    }
    try {
      final result = await request();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.error(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<BreedModel>>> getBreeds() {
    return _safeRequest(() => _apiService.getBreeds());
  }
}
