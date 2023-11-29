// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayersStruct extends BaseStruct {
  PlayersStruct({
    PlayerStruct? players,
  }) : _players = players;

  // "players" field.
  PlayerStruct? _players;
  PlayerStruct get players => _players ?? PlayerStruct();
  set players(PlayerStruct? val) => _players = val;
  void updatePlayers(Function(PlayerStruct) updateFn) =>
      updateFn(_players ??= PlayerStruct());
  bool hasPlayers() => _players != null;

  static PlayersStruct fromMap(Map<String, dynamic> data) => PlayersStruct(
        players: PlayerStruct.maybeFromMap(data['players']),
      );

  static PlayersStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlayersStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'players': _players?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'players': serializeParam(
          _players,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PlayersStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayersStruct(
        players: deserializeStructParam(
          data['players'],
          ParamType.DataStruct,
          false,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PlayersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlayersStruct && players == other.players;
  }

  @override
  int get hashCode => const ListEquality().hash([players]);
}

PlayersStruct createPlayersStruct({
  PlayerStruct? players,
}) =>
    PlayersStruct(
      players: players ?? PlayerStruct(),
    );
