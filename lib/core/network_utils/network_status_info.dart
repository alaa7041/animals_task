
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkStatusInfo {
  Future<bool> get isConnected;
}

class NetworkStatusInfoImpl implements NetworkStatusInfo {
  final Connectivity _connectivity;

  NetworkStatusInfoImpl(this._connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result[0] != ConnectivityResult.none;
  }
}
