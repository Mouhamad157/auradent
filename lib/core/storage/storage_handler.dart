import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'encryption.dart';

class StorageHandler {
  late final GetStorage _storage = GetStorage('app', path);
  static late final String? path;

  static Future<void> init() async {
    if (Platform.isWindows) {
      path = Directory.current.path;
    } else {
      path = null;
    }
    await GetStorage('app', path).initStorage;
    print('StorageHandler : initialized to path : $path');
  }

  static StorageHandler? _instance;

  StorageHandler._();

  factory StorageHandler() => _instance ??= StorageHandler._();

  Future<void> setToken(String token) =>
      _storage.write('token', Encryption.encrypt(token));

  Future<void> setRoleId(int id) =>
      _storage.write('roleId', Encryption.encrypt(id));

  Future<void> setProfileStatus(String profileStatus) =>
      _storage.write('profile_status', Encryption.encrypt(profileStatus));

  Future<void> setLanguage(String language) =>
      _storage.write('language', Encryption.encrypt(language));

  Future<void> removeToken() => _storage.remove('token');

  bool get hasToken => _storage.hasData('token');

  bool get hasRoleId => _storage.hasData('roleId');

  bool get hasProfileStatus => _storage.hasData('profile_status');

  bool get hasLanguage => _storage.hasData('language');

  String get token =>
      hasToken ? Encryption.decrypt(_storage.read('token')) : 'no token';

  String get roleId =>
      hasRoleId ? Encryption.decrypt(_storage.read('roleId')) : 'no roleId';

  bool get profileStatus =>
      hasProfileStatus ? Encryption.decrypt(_storage.read('profile_status')) : false;

  String get language =>
      hasLanguage ? Encryption.decrypt(_storage.read('language')) : 'en';
}
