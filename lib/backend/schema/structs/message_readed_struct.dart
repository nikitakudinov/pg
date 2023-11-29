// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageReadedStruct extends BaseStruct {
  MessageReadedStruct({
    List<PlayerStruct>? players,
  }) : _players = players;

  // "players" field.
  List<PlayerStruct>? _players;
  List<PlayerStruct> get players => _players ?? const [];
  set players(List<PlayerStruct>? val) => _players = val;
  void updatePlayers(Function(List<PlayerStruct>) updateFn) =>
      updateFn(_players ??= []);
  bool hasPlayers() => _players != null;

  static MessageReadedStruct fromMap(Map<String, dynamic> data) =>
      MessageReadedStruct(
        players: getStructList(
          data['players'],
          PlayerStruct.fromMap,
        ),
      );

  static MessageReadedStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MessageReadedStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'players': _players?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'players': serializeParam(
          _players,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static MessageReadedStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageReadedStruct(
        players: deserializeStructParam<PlayerStruct>(
          data['players'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MessageReadedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MessageReadedStruct &&
        listEquality.equals(players, other.players);
  }

  @override
  int get hashCode => const ListEquality().hash([players]);
}

MessageReadedStruct createMessageReadedStruct() => MessageReadedStruct();
