// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TournamentMemberStruct extends BaseStruct {
  TournamentMemberStruct({
    int? teamId,
    int? tournamentId,
    DateTime? createdAt,
    int? id,
  })  : _teamId = teamId,
        _tournamentId = tournamentId,
        _createdAt = createdAt,
        _id = id;

  // "team_id" field.
  int? _teamId;
  int get teamId => _teamId ?? 0;
  set teamId(int? val) => _teamId = val;
  void incrementTeamId(int amount) => _teamId = teamId + amount;
  bool hasTeamId() => _teamId != null;

  // "tournament_id" field.
  int? _tournamentId;
  int get tournamentId => _tournamentId ?? 0;
  set tournamentId(int? val) => _tournamentId = val;
  void incrementTournamentId(int amount) =>
      _tournamentId = tournamentId + amount;
  bool hasTournamentId() => _tournamentId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  static TournamentMemberStruct fromMap(Map<String, dynamic> data) =>
      TournamentMemberStruct(
        teamId: castToType<int>(data['team_id']),
        tournamentId: castToType<int>(data['tournament_id']),
        createdAt: data['created_at'] as DateTime?,
        id: castToType<int>(data['id']),
      );

  static TournamentMemberStruct? maybeFromMap(dynamic data) => data is Map
      ? TournamentMemberStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'team_id': _teamId,
        'tournament_id': _tournamentId,
        'created_at': _createdAt,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'team_id': serializeParam(
          _teamId,
          ParamType.int,
        ),
        'tournament_id': serializeParam(
          _tournamentId,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static TournamentMemberStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TournamentMemberStruct(
        teamId: deserializeParam(
          data['team_id'],
          ParamType.int,
          false,
        ),
        tournamentId: deserializeParam(
          data['tournament_id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TournamentMemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TournamentMemberStruct &&
        teamId == other.teamId &&
        tournamentId == other.tournamentId &&
        createdAt == other.createdAt &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([teamId, tournamentId, createdAt, id]);
}

TournamentMemberStruct createTournamentMemberStruct({
  int? teamId,
  int? tournamentId,
  DateTime? createdAt,
  int? id,
}) =>
    TournamentMemberStruct(
      teamId: teamId,
      tournamentId: tournamentId,
      createdAt: createdAt,
      id: id,
    );
