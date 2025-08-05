// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountResponseImpl _$$AccountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountResponseImpl(
      userId: (json['userId'] as num).toInt(),
      studentNumber: (json['studentNumber'] as num).toInt(),
      nickName: json['nickName'] as String,
      realName: json['realName'] as String,
      profilePicture: json['profilePicture'] as String?,
      email: json['email'] as String,
      role: json['role'] as String,
      gender: json['gender'] as String,
      accountNumber: json['accountNumber'] as String?,
    );

Map<String, dynamic> _$$AccountResponseImplToJson(
        _$AccountResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'studentNumber': instance.studentNumber,
      'nickName': instance.nickName,
      'realName': instance.realName,
      'profilePicture': instance.profilePicture,
      'email': instance.email,
      'role': instance.role,
      'gender': instance.gender,
      'accountNumber': instance.accountNumber,
    };
