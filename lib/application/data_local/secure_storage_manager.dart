import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> saveString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getString(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> saveInt(String key, int value) async {
    await _secureStorage.write(key: key, value: value.toString());
  }

  Future<int?> getInt(String key) async {
    String? stringValue = await _secureStorage.read(key: key);
    return stringValue != null ? int.tryParse(stringValue) : null;
  }

  Future<void> saveBool(String key, bool value) async {
    await _secureStorage.write(key: key, value: value.toString());
  }

  Future<bool?> getBool(String key) async {
    String? stringValue = await _secureStorage.read(key: key);
    return stringValue != null ? stringValue.toLowerCase() == 'true' : null;
  }

  Future<void> saveList(String key, List<String> list) async {
    String listString = list.join(",");
    await _secureStorage.write(key: key, value: listString);
  }

  Future<List<String>?> getList(String key) async {
    String? listString = await _secureStorage.read(key: key);
    if (listString != null && listString.isNotEmpty) {
      return listString.split(",");
    }
    return null;
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }
}
