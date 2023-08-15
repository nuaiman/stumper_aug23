import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum StumpType {
  basic('basic'),
  hazard('hazard');

  final String type;
  const StumpType(this.type);
}

extension ConvertStumpType on String {
  StumpType toStumpTypeTypeEnum() {
    switch (this) {
      case 'basic':
        return StumpType.basic;
      case 'hazard':
        return StumpType.hazard;
      default:
        return StumpType.basic;
    }
  }
}

class StumpModel {
  final String id;
  final StumpType type;
  final double height;
  final double weight;
  final double price;
  final List<String> imagePaths;
  final List<String> videoPaths;
  final String note;
  StumpModel({
    String? id,
    required this.type,
    required this.height,
    required this.weight,
    required this.price,
    required this.imagePaths,
    required this.videoPaths,
    required this.note,
  }) : id = id ?? uuid.v4();

  StumpModel copyWith({
    String? id,
    StumpType? type,
    double? height,
    double? weight,
    double? price,
    List<String>? imagePaths,
    List<String>? videoPaths,
    String? note,
  }) {
    return StumpModel(
      id: id ?? this.id,
      type: type ?? this.type,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      price: price ?? this.price,
      imagePaths: imagePaths ?? this.imagePaths,
      videoPaths: videoPaths ?? this.videoPaths,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'type': type.type});
    result.addAll({'height': height});
    result.addAll({'weight': weight});
    result.addAll({'price': price});
    result.addAll({'imagePaths': imagePaths});
    result.addAll({'videoPaths': videoPaths});
    result.addAll({'note': note});

    return result;
  }

  factory StumpModel.fromMap(Map<String, dynamic> map) {
    return StumpModel(
      id: map['id'] ?? '',
      type: (map['type'] as String).toStumpTypeTypeEnum(),
      height: map['height']?.toDouble() ?? 0.0,
      weight: map['weight']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      imagePaths: List<String>.from(map['imagePaths']),
      videoPaths: List<String>.from(map['videoPaths']),
      note: map['note'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StumpModel.fromJson(String source) =>
      StumpModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StumpModel(id: $id, type: $type, height: $height, weight: $weight, price: $price, imagePaths: $imagePaths, videoPaths: $videoPaths, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StumpModel &&
        other.id == id &&
        other.type == type &&
        other.height == height &&
        other.weight == weight &&
        other.price == price &&
        listEquals(other.imagePaths, imagePaths) &&
        listEquals(other.videoPaths, videoPaths) &&
        other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        price.hashCode ^
        imagePaths.hashCode ^
        videoPaths.hashCode ^
        note.hashCode;
  }
}
