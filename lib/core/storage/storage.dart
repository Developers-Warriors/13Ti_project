import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  static const keyValue = 'token';
  static const accessToken = 'accessToken';
  static const isLogin = 'isLogin';
  static const isRefreshToken = 'refreshToken';

  Future<void> writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String> readSecureData(String key) async {
    String value = await storage.read(key: key) ?? 'No data found!';
    print('Data read from secure storage: $value');
    return value;
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }

  Future<void> writeAccessToken(String token) async {
    await writeSecureData(accessToken, token);
  }

  Future<String> readAccesToken() async {
    String value = await readSecureData(accessToken);
    return value;
  }

  Future<void> writeIsLogin(bool isUserLogin) async {
    await writeSecureData(isLogin, isUserLogin.toString());
  }

  Future<bool> readIsLogin() async {
    bool value = await readSecureData(isLogin) == 'true';
    return value;
  }

  Future<void> writeRefreshToken(String token) async {
    await writeSecureData(isRefreshToken, token);
  }

  Future<String> readRefreshToken() async {
    String value = await readSecureData(isRefreshToken);
    return value;
  }
}
