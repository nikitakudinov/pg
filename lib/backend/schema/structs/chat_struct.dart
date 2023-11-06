// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends BaseStruct {
  ChatStruct({
    int? id,
    String? createdAt,
  })  : _id = id,
        _createdAt = createdAt;

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

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as String?,
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChatStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
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
      }.withoutNulls;

  static ChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStruct(
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
      );

  @override
  String toString() => 'ChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatStruct &&
        id == other.id &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality().hash([id, createdAt]);
}

ChatStruct createChatStruct({
  int? id,
  String? createdAt,
}) =>
    ChatStruct(
      id: id,
      createdAt: createdAt,
    );
