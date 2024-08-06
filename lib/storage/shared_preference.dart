
import 'package:shared_preferences/shared_preferences.dart';


class UserPreference  {
  UserPreference._();
  static SharedPreferences? preferences;
  static const String userId = 'userid';
  static const String accessToken = 'access_token';
  static const String fullName = 'full_name';

  ///---initialize Preference get set---
  static Future initSharedPreference() async {
    preferences = await SharedPreferences.getInstance();
  }

  ///--- Clear All Preference get set---
  static Future clearAllSharedPreferences() async {
     preferences = await SharedPreferences.getInstance();
    await preferences?.clear();
  }

  ///--- Set & Get String From Key---
  static void setIntPref(String strKey, int strValue) {
    preferences?.setInt(strKey, strValue);
  }

  static int? getIntPrefUserId(String strKey) {
    return preferences?.getInt(strKey);
  }

  static void setStringPref(String strKey, String strValue) {
    preferences?.setString(strKey, strValue);
  }

  static String? getStringPref(String strKey) {
    return preferences?.getString(strKey);
  }

  static void setBoolPref(String strKey, bool strValue) {
    preferences?.setBool(strKey, strValue);
  }

  static bool? getBoolPref(String strKey) {
    return preferences?.getBool(strKey);
  }
}
