// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TournamentMemberStruct extends BaseStruct {
  TournamentMemberStruct({
    int? teamId,
    int? tournamentId,
    int? id,
    String? createdAt,
  })  : _teamId = teamId,
        _tournamentId = tournamentId,
        _id = id,
        _createdAt = createdAt;

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

  static TournamentMemberStruct fromMap(Map<String, dynamic> data) =>
      TournamentMemberStruct(
        teamId: castToType<int>(data['team_id']),
        tournamentId: castToType<int>(data['tournament_id']),
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as String?,
      );

  static TournamentMemberStruct? maybeFromMap(dynamic data) => data is Map
      ? TournamentMemberStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'team_id': _teamId,
        'tournament_id': _tournamentId,
        'id': _id,
        'created_at': _createdAt,
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
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
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
      );

  @override
  String toString() => 'TournamentMemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TournamentMemberStruct &&
        teamId == other.teamId &&
        tournamentId == other.tournamentId &&
        id == other.id &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([teamId, tournamentId, id, createdAt]);
}

TournamentMemberStruct createTournamentMemberStruct({
  int? teamId,
  int? tournamentId,
  int? id,
  String? createdAt,
}) =>
    TournamentMemberStruct(
      teamId: teamId,
      tournamentId: tournamentId,
      id: id,
      createdAt: createdAt,
    );
