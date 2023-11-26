import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Method to store a JWT token securely
  Future<void> storeToken(String token) async {
    await _storage.write(key: 'bearer_token', value: token);
  }

  // Method to retrieve the stored JWT token
  Future<String?> getToken() async {
    return await _storage.read(key: 'bearer_token');
  }

  // Method to delete the stored JWT token
  Future<void> deleteToken() async {
    await _storage.delete(key: 'bearer_token');
  }

  // Method to delete the stored data
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
