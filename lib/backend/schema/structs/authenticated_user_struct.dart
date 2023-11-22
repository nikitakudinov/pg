// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthenticatedUserStruct extends BaseStruct {
  AuthenticatedUserStruct({
    PlayerStruct? playerData,
    TeamStruct? teamData,
  })  : _playerData = playerData,
        _teamData = teamData;

  // "playerData" field.
  PlayerStruct? _playerData;
  PlayerStruct get playerData => _playerData ?? PlayerStruct();
  set playerData(PlayerStruct? val) => _playerData = val;
  void updatePlayerData(Function(PlayerStruct) updateFn) =>
      updateFn(_playerData ??= PlayerStruct());
  bool hasPlayerData() => _playerData != null;

  // "teamData" field.
  TeamStruct? _teamData;
  TeamStruct get teamData => _teamData ?? TeamStruct();
  set teamData(TeamStruct? val) => _teamData = val;
  void updateTeamData(Function(TeamStruct) updateFn) =>
      updateFn(_teamData ??= TeamStruct());
  bool hasTeamData() => _teamData != null;

  static AuthenticatedUserStruct fromMap(Map<String, dynamic> data) =>
      AuthenticatedUserStruct(
        playerData: PlayerStruct.maybeFromMap(data['playerData']),
        teamData: TeamStruct.maybeFromMap(data['teamData']),
      );

  static AuthenticatedUserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? AuthenticatedUserStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'playerData': _playerData?.toMap(),
        'teamData': _teamData?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'playerData': serializeParam(
          _playerData,
          ParamType.DataStruct,
        ),
        'teamData': serializeParam(
          _teamData,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AuthenticatedUserStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AuthenticatedUserStruct(
        playerData: deserializeStructParam(
          data['playerData'],
          ParamType.DataStruct,
          false,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        teamData: deserializeStructParam(
          data['teamData'],
          ParamType.DataStruct,
          false,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AuthenticatedUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthenticatedUserStruct &&
        playerData == other.playerData &&
        teamData == other.teamData;
  }

  @override
  int get hashCode => const ListEquality().hash([playerData, teamData]);
}

AuthenticatedUserStruct createAuthenticatedUserStruct({
  PlayerStruct? playerData,
  TeamStruct? teamData,
}) =>
    AuthenticatedUserStruct(
      playerData: playerData ?? PlayerStruct(),
      teamData: teamData ?? TeamStruct(),
    );
