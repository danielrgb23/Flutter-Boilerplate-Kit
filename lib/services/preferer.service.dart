import 'package:config_flutter/data/storage.dart';

class PrefererService {
  static const TOKEN = 'token';
  static const USER_ID = 'user_id';
  static const USERHASH = 'userhash';
  static const USER_LANGUAGE = 'user_language';
  static const TOKEN_TIMESTAMP = 'user_load_timestamp';

  static Future<String?> getToken() async {
    return await Storage.read(TOKEN);
  }

  static Future<String?> getUserHash() async {
    return await Storage.read(USERHASH);
  }

  static Future<String?> getUserId() async {
    return await Storage.read(USER_ID);
  }

  static Future<String?> getUserLanguage() async {
    return await Storage.read(USER_LANGUAGE);
  }

  static Future<int?> getTokenTimeStamp() async {
    return await Storage.read(TOKEN_TIMESTAMP);
  }

  static Future<T?> readValue<T>(String key) async {
    return await Storage.read(key);
  }

  static Future<void> setToken(item) async {
    await Storage.write(TOKEN, item);
  }

  static Future<void> setUserHash(item) async {
    await Storage.write(USERHASH, item);
  }

  static Future<void> setUserId(item) async {
    await Storage.write(USER_ID, item);
  }

  static Future<void> setUserLanguage(item) async {
    await Storage.write(USER_LANGUAGE, item);
  }

  static Future<void> setTokenTimeStamp(int item) async {
    await Storage.write(TOKEN_TIMESTAMP, item);
  }

  static Future<void> writeValue<T>(String key, T value) async {
    await Storage.write(key, value);
  }
}
