// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageReadedStruct extends BaseStruct {
  MessageReadedStruct({
    int? id,
    String? createdAt,
    int? messageId,
    PlayerStruct? playerUid,
  })  : _id = id,
        _createdAt = createdAt,
        _messageId = messageId,
        _playerUid = playerUid;

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

  // "message_id" field.
  int? _messageId;
  int get messageId => _messageId ?? 0;
  set messageId(int? val) => _messageId = val;
  void incrementMessageId(int amount) => _messageId = messageId + amount;
  bool hasMessageId() => _messageId != null;

  // "player_uid" field.
  PlayerStruct? _playerUid;
  PlayerStruct get playerUid => _playerUid ?? PlayerStruct();
  set playerUid(PlayerStruct? val) => _playerUid = val;
  void updatePlayerUid(Function(PlayerStruct) updateFn) =>
      updateFn(_playerUid ??= PlayerStruct());
  bool hasPlayerUid() => _playerUid != null;

  static MessageReadedStruct fromMap(Map<String, dynamic> data) =>
      MessageReadedStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as String?,
        messageId: castToType<int>(data['message_id']),
        playerUid: PlayerStruct.maybeFromMap(data['player_uid']),
      );

  static MessageReadedStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MessageReadedStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'message_id': _messageId,
        'player_uid': _playerUid?.toMap(),
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
        'message_id': serializeParam(
          _messageId,
          ParamType.int,
        ),
        'player_uid': serializeParam(
          _playerUid,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MessageReadedStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageReadedStruct(
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
        messageId: deserializeParam(
          data['message_id'],
          ParamType.int,
          false,
        ),
        playerUid: deserializeStructParam(
          data['player_uid'],
          ParamType.DataStruct,
          false,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MessageReadedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageReadedStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        messageId == other.messageId &&
        playerUid == other.playerUid;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, createdAt, messageId, playerUid]);
}

MessageReadedStruct createMessageReadedStruct({
  int? id,
  String? createdAt,
  int? messageId,
  PlayerStruct? playerUid,
}) =>
    MessageReadedStruct(
      id: id,
      createdAt: createdAt,
      messageId: messageId,
      playerUid: playerUid ?? PlayerStruct(),
    );
