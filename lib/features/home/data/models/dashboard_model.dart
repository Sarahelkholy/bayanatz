// Firestore and JSON representation of a dashboard document.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "boardName")
  final String? boardName;
  @JsonKey(name: "departmentName")
  final String? departmentName;
  @JsonKey(name: "owningStatus")
  final String? owningStatus;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: 'createdAt', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime? createdAt;

  DashboardModel({
    this.id,
    this.boardName,
    this.owningStatus,
    this.departmentName,
    this.description,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return _$DashboardModelToJson(this);
  }

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);
}

DateTime? _dateTimeFromJson(Object? value) {
  if (value == null) return null;
  if (value is Timestamp) return value.toDate();
  if (value is DateTime) return value;
  if (value is String) return DateTime.parse(value);
  throw FormatException('Unsupported dashboard date value: $value');
}

String? _dateTimeToJson(DateTime? value) => value?.toIso8601String();
