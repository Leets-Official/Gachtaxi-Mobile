import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  static final _storage = FlutterSecureStorage();

  static const _userIdKey = 'userId';
  static const _studentNumberKey = 'studentNumber';
  static const _nicknameKey = 'nickname';
  static const _realNameKey = 'realName';
  static const _profilePictureKey = 'profilePicture';
  static const _emailKey = 'email';
  static const _roleKey = 'role';
  static const _genderKey = 'gender';
  static const _accountNumberKey = 'accountNumber';

  static Future<void> saveUserInfo({
    required int userId,
    required int studentNumber,
    required String nickname,
    required String realName,
    String? profilePicture,
    required String email,
    required String role,
    required String gender,
    String? accountNumber,
  }) async {
    await _storage.write(key: _userIdKey, value: userId.toString());
    await _storage.write(key: _studentNumberKey, value: studentNumber.toString());
    await _storage.write(key: _nicknameKey, value: nickname);
    await _storage.write(key: _realNameKey, value: realName);
    await _storage.write(key: _profilePictureKey, value: profilePicture ?? '');
    await _storage.write(key: _emailKey, value: email);
    await _storage.write(key: _roleKey, value: role);
    await _storage.write(key: _genderKey, value: gender);
    await _storage.write(key: _accountNumberKey, value: accountNumber ?? '');
  }

  static Future<void> clearUserInfo() async {
    await _storage.deleteAll();
  }

  static Future<String?> getNickname() => _storage.read(key: _nicknameKey);
  static Future<String?> getStudentNumber() => _storage.read(key: _studentNumberKey);

  static Future<String?> getProfilePicture() => _storage.read(key: _profilePictureKey);

}
