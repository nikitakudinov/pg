// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayerUidStruct extends BaseStruct {
  PlayerUidStruct({
    String? playerUid,
  }) : _playerUid = playerUid;

  // "player_uid" field.
  String? _playerUid;
  String get playerUid => _playerUid ?? '';
  set playerUid(String? val) => _playerUid = val;
  bool hasPlayerUid() => _playerUid != null;

  static PlayerUidStruct fromMap(Map<String, dynamic> data) => PlayerUidStruct(
        playerUid: data['player_uid'] as String?,
      );

  static PlayerUidStruct? maybeFromMap(dynamic data) => data is Map
      ? PlayerUidStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static PlayerUidStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayerUidStruct(
        playerUid: deserializeParam(
          data['player_uid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlayerUidStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlayerUidStruct && playerUid == other.playerUid;
  }

  @override
  int get hashCode => const ListEquality().hash([playerUid]);
}

PlayerUidStruct createPlayerUidStruct({
  String? playerUid,
}) =>
    PlayerUidStruct(
      playerUid: playerUid,
    );
