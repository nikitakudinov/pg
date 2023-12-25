// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaindataStruct extends BaseStruct {
  MaindataStruct({
    List<PlayerStruct>? players,
    List<TeamStruct>? teams,
    PlayerStruct? authplayer,
  })  : _players = players,
        _teams = teams,
        _authplayer = authplayer;

  // "PLAYERS" field.
  List<PlayerStruct>? _players;
  List<PlayerStruct> get players => _players ?? const [];
  set players(List<PlayerStruct>? val) => _players = val;
  void updatePlayers(Function(List<PlayerStruct>) updateFn) =>
      updateFn(_players ??= []);
  bool hasPlayers() => _players != null;

  // "TEAMS" field.
  List<TeamStruct>? _teams;
  List<TeamStruct> get teams => _teams ?? const [];
  set teams(List<TeamStruct>? val) => _teams = val;
  void updateTeams(Function(List<TeamStruct>) updateFn) =>
      updateFn(_teams ??= []);
  bool hasTeams() => _teams != null;

  // "AUTHPLAYER" field.
  PlayerStruct? _authplayer;
  PlayerStruct get authplayer => _authplayer ?? PlayerStruct();
  set authplayer(PlayerStruct? val) => _authplayer = val;
  void updateAuthplayer(Function(PlayerStruct) updateFn) =>
      updateFn(_authplayer ??= PlayerStruct());
  bool hasAuthplayer() => _authplayer != null;

  static MaindataStruct fromMap(Map<String, dynamic> data) => MaindataStruct(
        players: getStructList(
          data['PLAYERS'],
          PlayerStruct.fromMap,
        ),
        teams: getStructList(
          data['TEAMS'],
          TeamStruct.fromMap,
        ),
        authplayer: PlayerStruct.maybeFromMap(data['AUTHPLAYER']),
      );

  static MaindataStruct? maybeFromMap(dynamic data) =>
      data is Map ? MaindataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'PLAYERS': _players?.map((e) => e.toMap()).toList(),
        'TEAMS': _teams?.map((e) => e.toMap()).toList(),
        'AUTHPLAYER': _authplayer?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'PLAYERS': serializeParam(
          _players,
          ParamType.DataStruct,
          true,
        ),
        'TEAMS': serializeParam(
          _teams,
          ParamType.DataStruct,
          true,
        ),
        'AUTHPLAYER': serializeParam(
          _authplayer,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MaindataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MaindataStruct(
        players: deserializeStructParam<PlayerStruct>(
          data['PLAYERS'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        teams: deserializeStructParam<TeamStruct>(
          data['TEAMS'],
          ParamType.DataStruct,
          true,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
        authplayer: deserializeStructParam(
          data['AUTHPLAYER'],
          ParamType.DataStruct,
          false,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MaindataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MaindataStruct &&
        listEquality.equals(players, other.players) &&
        listEquality.equals(teams, other.teams) &&
        authplayer == other.authplayer;
  }

  @override
  int get hashCode => const ListEquality().hash([players, teams, authplayer]);
}

MaindataStruct createMaindataStruct({
  PlayerStruct? authplayer,
}) =>
    MaindataStruct(
      authplayer: authplayer ?? PlayerStruct(),
    );
