import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  final _storage = const FlutterSecureStorage();
  final _tokenKey = 'auth_token';
  final _userIdKey = 'user_id';
  final _userNameKey = 'user_name';
  final _userPhotoKey = 'user_photo';

  // Token işlemleri
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> removeToken() async {
    await _storage.delete(key: _tokenKey);
  }

  // Kullanıcı id işlemleri
  Future<void> saveUserId(String id) async {
    await _storage.write(key: _userIdKey, value: id);
  }

  Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  Future<void> removeUserId() async {
    await _storage.delete(key: _userIdKey);
  }

  // Kullanıcı adı işlemleri
  Future<void> saveUserName(String name) async {
    await _storage.write(key: _userNameKey, value: name);
  }

  Future<String?> getUserName() async {
    return await _storage.read(key: _userNameKey);
  }

  Future<void> removeUserName() async {
    await _storage.delete(key: _userNameKey);
  }

  // Kullanıcı fotoğraf işlemleri
  Future<void> saveUserPhoto(String photoUrl) async {
    await _storage.write(key: _userPhotoKey, value: photoUrl);
  }

  Future<String?> getUserPhoto() async {
    return await _storage.read(key: _userPhotoKey);
  }

  Future<void> removeUserPhoto() async {
    await _storage.delete(key: _userPhotoKey);
  }

  // Tüm verileri temizleme
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
