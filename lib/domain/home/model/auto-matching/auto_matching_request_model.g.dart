// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_matching_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AutoMatchingRequestImpl _$$AutoMatchingRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AutoMatchingRequestImpl(
      startPoint: json['startPoint'] as String,
      destinationPoint: json['destinationPoint'] as String,
      startName: json['startName'] as String?,
      destinationName: json['destinationName'] as String?,
      criteria: (json['criteria'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      expectedTotalCharge: (json['expectedTotalCharge'] as num?)?.toInt(),
      departure: json['departure'] as String?,
      destination: json['destination'] as String?,
    );

Map<String, dynamic> _$$AutoMatchingRequestImplToJson(
        _$AutoMatchingRequestImpl instance) =>
    <String, dynamic>{
      'startPoint': instance.startPoint,
      'destinationPoint': instance.destinationPoint,
      'startName': instance.startName,
      'destinationName': instance.destinationName,
      'criteria': instance.criteria,
      'members': instance.members,
      'expectedTotalCharge': instance.expectedTotalCharge,
      'departure': instance.departure,
      'destination': instance.destination,
    };
