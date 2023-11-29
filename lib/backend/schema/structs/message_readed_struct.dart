// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageReadedStruct extends BaseStruct {
  MessageReadedStruct({
    String? playerUid,
  }) : _playerUid = playerUid;

  // "player_uid" field.
  String? _playerUid;
  String get playerUid => _playerUid ?? '';
  set playerUid(String? val) => _playerUid = val;
  bool hasPlayerUid() => _playerUid != null;

  static MessageReadedStruct fromMap(Map<String, dynamic> data) =>
      MessageReadedStruct(
        playerUid: data['player_uid'] as String?,
      );

  static MessageReadedStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MessageReadedStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'player_uid': _playerUid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'player_uid': serializeParam(
          _playerUid,
          ParamType.String,
        ),
      }.withoutNulls;

  static MessageReadedStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageReadedStruct(
        playerUid: deserializeParam(
          data['player_uid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MessageReadedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageReadedStruct && playerUid == other.playerUid;
  }

  @override
  int get hashCode => const ListEquality().hash([playerUid]);
}

MessageReadedStruct createMessageReadedStruct({
  String? playerUid,
}) =>
    MessageReadedStruct(
      playerUid: playerUid,
    );
