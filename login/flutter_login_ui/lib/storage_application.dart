import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final Storage _storage = Storage._internal();
  final storage = FlutterSecureStorage();

  factory Storage() {
    return _storage;
  }

  Storage._internal();

  void saveToken(String tokenJWT) async {
    await storage.write(key: 'tokenJWT', value: tokenJWT);
  }

  void saveAccount(String account) async {
    await storage.write(key: 'account', value: account);
  }

  void savePassword(String password) async {
    await storage.write(key: 'password', value: password);
  }

  void deleteInfo() async {
    await storage.deleteAll();
  }

  Future<String> getAccount() async {
    return await storage.read(key: 'account');
  }

  Future<String> getPassword() async {
    return await storage.read(key: 'password');
  }

  Future<String> getToken() async {
    return await storage.read(key: 'tokenJWT');
  }
}
