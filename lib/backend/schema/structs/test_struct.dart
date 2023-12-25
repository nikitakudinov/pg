// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestStruct extends BaseStruct {
  TestStruct({
    int? id,
    String? createdAt,
    String? name,
    String? surname,
  })  : _id = id,
        _createdAt = createdAt,
        _name = name,
        _surname = surname;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  set surname(String? val) => _surname = val;
  bool hasSurname() => _surname != null;

  static TestStruct fromMap(Map<String, dynamic> data) => TestStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as String?,
        name: data['name'] as String?,
        surname: data['surname'] as String?,
      );

  static TestStruct? maybeFromMap(dynamic data) =>
      data is Map ? TestStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'name': _name,
        'surname': _surname,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'surname': serializeParam(
          _surname,
          ParamType.String,
        ),
      }.withoutNulls;

  static TestStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        surname: deserializeParam(
          data['surname'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        name == other.name &&
        surname == other.surname;
  }

  @override
  int get hashCode => const ListEquality().hash([id, createdAt, name, surname]);
}

TestStruct createTestStruct({
  int? id,
  String? createdAt,
  String? name,
  String? surname,
}) =>
    TestStruct(
      id: id,
      createdAt: createdAt,
      name: name,
      surname: surname,
    );
