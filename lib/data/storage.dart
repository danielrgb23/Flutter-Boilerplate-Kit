import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Storage {
  static const _TOKEN_KEY = 'TOKEN_EXEMPLE';

  static final storage = FlutterSecureStorage();

  static Future<void> setToken(String token) {
    return storage.write(key: _TOKEN_KEY, value: token);
  }

  static Future<String?> getToken() {
    return storage.read(key: _TOKEN_KEY);
  }

  static Future<void> clearToken() {
    return storage.delete(key: _TOKEN_KEY);
  }

  static Future<void> clearItens(String key) {
    return storage.delete(key: key);
  }

  static Future<void> clear() async {
    await storage.deleteAll();
  }

  static Future<void> write(String key, dynamic item) {
    return storage.write(key: key, value: jsonEncode(item));
  }

  static Future<dynamic> read(String key) async {
    final raw = await storage.read(key: key);
    return raw == null ? null : jsonDecode(raw);
  }
}
