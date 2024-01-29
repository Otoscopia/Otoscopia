// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SchoolEntity {
  final String id;
  final String name;
  final String abbr;
  final String code;
  final String address;

  SchoolEntity({
    required this.id,
    required this.name,
    required this.abbr,
    required this.code,
    required this.address,
  });

  SchoolEntity copyWith({
    String? id,
    String? name,
    String? abbr,
    String? code,
    String? address,
  }) {
    return SchoolEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      abbr: abbr ?? this.abbr,
      code: code ?? this.code,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'abbr': abbr,
      'code': code,
      'address': address,
    };
  }

  factory SchoolEntity.fromMap(Map<String, dynamic> map) {
    return SchoolEntity(
      id: map['\$id'] as String,
      name: map['name'] as String,
      abbr: map['abbr'] as String,
      code: map['code'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolEntity.fromJson(String source) =>
      SchoolEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SchoolEntity(id: $id, name: $name, abbr: $abbr, code: $code, address: $address)';
  }

  @override
  bool operator ==(covariant SchoolEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.abbr == abbr &&
        other.code == code &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        abbr.hashCode ^
        code.hashCode ^
        address.hashCode;
  }
}
