String appName = "Wosalnak";
String appVersion = "1.0.0";

bool isLoggedUser = false;

String? userName;
String? phoneNumber;

String langPath = "assets/lang";
String langCacheKey = "lang";

String countryCacheKey = "country";

String currentLanguage = 'ar';

class SharedPrefsKeys {
  static const String notShowOnboarding = "notShowOnboarding";
  static const String phoneNumber = "phoneNumber";
  static const String userName = "userName";

  static const String userToken = "userToken";
  static const String deviceId = "deviceId";
  static const String lang = "lang";
}
