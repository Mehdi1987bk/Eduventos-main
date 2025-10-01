

import 'dart:ui';

import '../network/response/user.dart';

abstract class CacheManager {

  Future<void> saveAccessToken(String token);

  Future<String?> getAccessToken();

  Future<void> saveRefreshToken(String token);

  Future<String?> getRefreshToken();

  Future<void> saveRefreshTokenTime(int expiresIn);

  Future<void> clear();

  Future<int> getRefreshTokenTime();

  Future<void> saveUser(User userDetails);

  Stream<User?> get userDetails;

  Future<void> saveType(int type);

  Stream<int?> get type;

  int? getUserType();

  Future<bool> isFirstOpen();

  Future<void> setIsFirstOpen();

  Future<void> saveLocale(Locale locale);

  Stream<Locale?> get locale;

  Locale? getLocale();
}
