import 'package:fluent_ui/fluent_ui.dart';
import 'package:ionicons/ionicons.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

class RemarksEntity {
  final String id;
  final String remarks;
  final String screening;
  final String? location;
  final RecordStatus status;
  final DateTime? date;

  RemarksEntity({
    required this.id,
    required this.remarks,
    required this.screening,
    required this.status,
    this.location,
    this.date,
  });

  factory RemarksEntity.fromMap(Map<String, dynamic> json) {
    RecordStatus status = getStatus(json['status']);
    DateTime? date =
        json['date'] != null ? DateTime.parse(json['date'] as String) : null;
    return RemarksEntity(
      id: json['\$id'] as String,
      remarks: json['remarks'] as String,
      location: json['location'] as String?,
      screening: json['screening']['\$id'] as String,
      status: status,
      date: date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'remarks': remarks,
      'screening': screening,
      'location': location,
      'status': statusText,
      'date': date?.toIso8601String(),
    };
  }

  IoniconsData get statusIcon {
    switch (status) {
      case RecordStatus.pending:
        return Ionicons.time_outline;
      case RecordStatus.followUp:
        return Ionicons.repeat_outline;
      case RecordStatus.medicalAttention:
        return Ionicons.warning_sharp;
      case RecordStatus.resolved:
        return Ionicons.checkmark_circle;
      default:
        return Ionicons.time_outline;
    }
  }

  Color get statusColor {
    switch (status) {
      case RecordStatus.pending:
        return Colors.yellow;
      case RecordStatus.followUp:
        return Colors.blue;
      case RecordStatus.medicalAttention:
        return Colors.red;
      case RecordStatus.resolved:
        return Colors.green;
      default:
        return AppColors.accentColor.darkest;
    }
  }

  String get statusString {
    switch (status) {
      case RecordStatus.pending:
        return 'Pending';
      case RecordStatus.followUp:
        return 'Follow Up';
      case RecordStatus.medicalAttention:
        return 'Medical Attention';
      case RecordStatus.resolved:
        return 'Resolved';
      default:
        return 'Pending';
    }
  }

  static RecordStatus getStatus(String status) {
    switch (status) {
      case "followUp":
        return RecordStatus.followUp;
      case "medicalAttention":
        return RecordStatus.medicalAttention;
      case "resolved":
        return RecordStatus.resolved;
      default:
        return RecordStatus.pending;
    }
  }

  String get statusText {
    switch (status) {
      case RecordStatus.followUp:
        return "followUp";
      case RecordStatus.medicalAttention:
        return "medicalAttention";
      case RecordStatus.resolved:
        return "resolved";
      default:
        return "pending";
    }
  }
}
