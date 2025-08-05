// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
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

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
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
