// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayerStruct extends BaseStruct {
  PlayerStruct({
    String? playerCreatedAt,
  }) : _playerCreatedAt = playerCreatedAt;

  // "player_created_at" field.
  String? _playerCreatedAt;
  String get playerCreatedAt => _playerCreatedAt ?? '';
  set playerCreatedAt(String? val) => _playerCreatedAt = val;
  bool hasPlayerCreatedAt() => _playerCreatedAt != null;

  static PlayerStruct fromMap(Map<String, dynamic> data) => PlayerStruct(
        playerCreatedAt: data['player_created_at'] as String?,
      );

  static PlayerStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlayerStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'player_created_at': _playerCreatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'player_created_at': serializeParam(
          _playerCreatedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlayerStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayerStruct(
        playerCreatedAt: deserializeParam(
          data['player_created_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlayerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlayerStruct && playerCreatedAt == other.playerCreatedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([playerCreatedAt]);
}

PlayerStruct createPlayerStruct({
  String? playerCreatedAt,
}) =>
    PlayerStruct(
      playerCreatedAt: playerCreatedAt,
    );
