// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaindataStruct extends BaseStruct {
  MaindataStruct({
    List<PlayerStruct>? players,
    List<TeamStruct>? teams,
  })  : _players = players,
        _teams = teams;

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

  static MaindataStruct fromMap(Map<String, dynamic> data) => MaindataStruct(
        players: getStructList(
          data['PLAYERS'],
          PlayerStruct.fromMap,
        ),
        teams: getStructList(
          data['TEAMS'],
          TeamStruct.fromMap,
        ),
      );

  static MaindataStruct? maybeFromMap(dynamic data) =>
      data is Map ? MaindataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'PLAYERS': _players?.map((e) => e.toMap()).toList(),
        'TEAMS': _teams?.map((e) => e.toMap()).toList(),
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
      );

  @override
  String toString() => 'MaindataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MaindataStruct &&
        listEquality.equals(players, other.players) &&
        listEquality.equals(teams, other.teams);
  }

  @override
  int get hashCode => const ListEquality().hash([players, teams]);
}

MaindataStruct createMaindataStruct() => MaindataStruct();
