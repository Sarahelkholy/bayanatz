// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      id: json['id'] as String?,
      boardName: json['boardName'] as String?,
      owningStatus: json['owningStatus'] as String?,
      departmentName: json['departmentName'] as String?,
      description: json['description'] as String?,
      createdAt: _dateTimeFromJson(json['createdAt']),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'boardName': instance.boardName,
      'departmentName': instance.departmentName,
      'owningStatus': instance.owningStatus,
      'description': instance.description,
      'createdAt': _dateTimeToJson(instance.createdAt),
    };
