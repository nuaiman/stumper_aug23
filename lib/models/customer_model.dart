import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class CustomerModel {
  final String id;
  final String name;
  final String number;
  final String email;
  final String imagePath;
  final bool source;
  final String note;
  final List<String> projectIds;
  CustomerModel({
    String? id,
    required this.name,
    required this.number,
    required this.email,
    required this.imagePath,
    required this.source,
    required this.note,
    required this.projectIds,
  }) : id = id ?? uuid.v4();

  CustomerModel copyWith({
    String? id,
    String? name,
    String? number,
    String? email,
    String? imagePath,
    bool? source,
    String? note,
    List<String>? projectIds,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      email: email ?? this.email,
      imagePath: imagePath ?? this.imagePath,
      source: source ?? this.source,
      note: note ?? this.note,
      projectIds: projectIds ?? this.projectIds,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'number': number});
    result.addAll({'email': email});
    result.addAll({'imagePath': imagePath});
    result.addAll({'source': source});
    result.addAll({'note': note});
    result.addAll({'projectIds': projectIds});

    return result;
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      number: map['number'] ?? '',
      email: map['email'] ?? '',
      imagePath: map['imagePath'] ?? '',
      source: map['source'] ?? false,
      note: map['note'] ?? '',
      projectIds: List<String>.from(map['projectIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomerModel(id: $id, name: $name, number: $number, email: $email, imagePath: $imagePath, source: $source, note: $note, projectIds: $projectIds)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomerModel &&
        other.id == id &&
        other.name == name &&
        other.number == number &&
        other.email == email &&
        other.imagePath == imagePath &&
        other.source == source &&
        other.note == note &&
        listEquals(other.projectIds, projectIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        number.hashCode ^
        email.hashCode ^
        imagePath.hashCode ^
        source.hashCode ^
        note.hashCode ^
        projectIds.hashCode;
  }
}
