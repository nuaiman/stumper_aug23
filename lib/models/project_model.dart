import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum ProjectStatus {
  all('all'),
  active('active'),
  cancelled('cancelled'),
  done('done');

  final String type;
  const ProjectStatus(this.type);
}

extension ConvertProjectStatus on String {
  ProjectStatus toProjectTypeEnum() {
    switch (this) {
      case 'all':
        return ProjectStatus.all;
      case 'active':
        return ProjectStatus.active;
      case 'done':
        return ProjectStatus.done;
      case 'cancelled':
        return ProjectStatus.cancelled;
      default:
        return ProjectStatus.all;
    }
  }
}

enum ProjectSource {
  web('web'),
  call('call');

  final String type;
  const ProjectSource(this.type);
}

extension ConvertProjectSource on String {
  ProjectSource toProjectSourceEnum() {
    switch (this) {
      case 'web':
        return ProjectSource.web;
      case 'call':
        return ProjectSource.call;
      default:
        return ProjectSource.web;
    }
  }
}

class ProjectModel {
  final String id;
  final String coverPath;
  final String customerId;
  final List<String> stumpIds;
  final int stumpCount;
  final ProjectStatus status;
  final ProjectSource source;
  final String note;
  final DateTime firstCall;
  final DateTime nextCall;
  final double lat;
  final double lon;
  final String address;
  ProjectModel({
    String? id,
    required this.coverPath,
    required this.customerId,
    required this.stumpIds,
    required this.stumpCount,
    required this.status,
    required this.source,
    required this.note,
    required this.firstCall,
    required this.nextCall,
    required this.lat,
    required this.lon,
    required this.address,
  }) : id = id ?? uuid.v4();

  ProjectModel copyWith({
    String? id,
    String? coverPath,
    String? customerId,
    List<String>? stumpIds,
    int? stumpCount,
    ProjectStatus? status,
    ProjectSource? source,
    String? note,
    DateTime? firstCall,
    DateTime? nextCall,
    double? lat,
    double? lon,
    String? address,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      coverPath: coverPath ?? this.coverPath,
      customerId: customerId ?? this.customerId,
      stumpIds: stumpIds ?? this.stumpIds,
      stumpCount: stumpCount ?? this.stumpCount,
      status: status ?? this.status,
      source: source ?? this.source,
      note: note ?? this.note,
      firstCall: firstCall ?? this.firstCall,
      nextCall: nextCall ?? this.nextCall,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'coverPath': coverPath});
    result.addAll({'customerId': customerId});
    result.addAll({'stumpIds': stumpIds});
    result.addAll({'stumpCount': stumpCount});
    result.addAll({'status': status.type});
    result.addAll({'source': source.type});
    result.addAll({'note': note});
    result.addAll({'firstCall': firstCall.millisecondsSinceEpoch});
    result.addAll({'nextCall': nextCall.millisecondsSinceEpoch});
    result.addAll({'lat': lat});
    result.addAll({'lon': lon});
    result.addAll({'address': address});

    return result;
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'] ?? '',
      coverPath: map['coverPath'] ?? '',
      customerId: map['customerId'] ?? '',
      stumpIds: List<String>.from(map['stumpIds']),
      stumpCount: map['stumpCount']?.toInt() ?? 0,
      status: (map['status'] as String).toProjectTypeEnum(),
      source: (map['source'] as String).toProjectSourceEnum(),
      note: map['note'] ?? '',
      firstCall: DateTime.fromMillisecondsSinceEpoch(map['firstCall']),
      nextCall: DateTime.fromMillisecondsSinceEpoch(map['nextCall']),
      lat: map['lat']?.toDouble() ?? 0.0,
      lon: map['lon']?.toDouble() ?? 0.0,
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProjectModel(id: $id, coverPath: $coverPath, customerId: $customerId, stumpIds: $stumpIds, stumpCount: $stumpCount, status: $status, source: $source, note: $note, firstCall: $firstCall, nextCall: $nextCall, lat: $lat, lon: $lon, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectModel &&
        other.id == id &&
        other.coverPath == coverPath &&
        other.customerId == customerId &&
        listEquals(other.stumpIds, stumpIds) &&
        other.stumpCount == stumpCount &&
        other.status == status &&
        other.source == source &&
        other.note == note &&
        other.firstCall == firstCall &&
        other.nextCall == nextCall &&
        other.lat == lat &&
        other.lon == lon &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        coverPath.hashCode ^
        customerId.hashCode ^
        stumpIds.hashCode ^
        stumpCount.hashCode ^
        status.hashCode ^
        source.hashCode ^
        note.hashCode ^
        firstCall.hashCode ^
        nextCall.hashCode ^
        lat.hashCode ^
        lon.hashCode ^
        address.hashCode;
  }
}
