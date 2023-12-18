// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchStruct extends BaseStruct {
  MatchStruct({
    int? matchId,
    String? matchPlannedDate,
    String? matchDate,
    int? matchTournamentRound,
    int? matchTournamentPair,
    String? matchStatus,
    String? matchRefery,
    TeamStruct? matchRival1,
    TeamStruct? matchRival2,
    TournamentStruct? matchForTournament,
    int? matchRival1Wins,
    int? matchRival2Wins,
  })  : _matchId = matchId,
        _matchPlannedDate = matchPlannedDate,
        _matchDate = matchDate,
        _matchTournamentRound = matchTournamentRound,
        _matchTournamentPair = matchTournamentPair,
        _matchStatus = matchStatus,
        _matchRefery = matchRefery,
        _matchRival1 = matchRival1,
        _matchRival2 = matchRival2,
        _matchForTournament = matchForTournament,
        _matchRival1Wins = matchRival1Wins,
        _matchRival2Wins = matchRival2Wins;

  // "match_id" field.
  int? _matchId;
  int get matchId => _matchId ?? 0;
  set matchId(int? val) => _matchId = val;
  void incrementMatchId(int amount) => _matchId = matchId + amount;
  bool hasMatchId() => _matchId != null;

  // "match_planned_date" field.
  String? _matchPlannedDate;
  String get matchPlannedDate => _matchPlannedDate ?? '0';
  set matchPlannedDate(String? val) => _matchPlannedDate = val;
  bool hasMatchPlannedDate() => _matchPlannedDate != null;

  // "match_date" field.
  String? _matchDate;
  String get matchDate => _matchDate ?? '0';
  set matchDate(String? val) => _matchDate = val;
  bool hasMatchDate() => _matchDate != null;

  // "match_tournament_round" field.
  int? _matchTournamentRound;
  int get matchTournamentRound => _matchTournamentRound ?? 0;
  set matchTournamentRound(int? val) => _matchTournamentRound = val;
  void incrementMatchTournamentRound(int amount) =>
      _matchTournamentRound = matchTournamentRound + amount;
  bool hasMatchTournamentRound() => _matchTournamentRound != null;

  // "match_tournament_pair" field.
  int? _matchTournamentPair;
  int get matchTournamentPair => _matchTournamentPair ?? 0;
  set matchTournamentPair(int? val) => _matchTournamentPair = val;
  void incrementMatchTournamentPair(int amount) =>
      _matchTournamentPair = matchTournamentPair + amount;
  bool hasMatchTournamentPair() => _matchTournamentPair != null;

  // "match_status" field.
  String? _matchStatus;
  String get matchStatus => _matchStatus ?? '0';
  set matchStatus(String? val) => _matchStatus = val;
  bool hasMatchStatus() => _matchStatus != null;

  // "match_refery" field.
  String? _matchRefery;
  String get matchRefery => _matchRefery ?? '0';
  set matchRefery(String? val) => _matchRefery = val;
  bool hasMatchRefery() => _matchRefery != null;

  // "match_rival1" field.
  TeamStruct? _matchRival1;
  TeamStruct get matchRival1 => _matchRival1 ?? TeamStruct();
  set matchRival1(TeamStruct? val) => _matchRival1 = val;
  void updateMatchRival1(Function(TeamStruct) updateFn) =>
      updateFn(_matchRival1 ??= TeamStruct());
  bool hasMatchRival1() => _matchRival1 != null;

  // "match_rival2" field.
  TeamStruct? _matchRival2;
  TeamStruct get matchRival2 => _matchRival2 ?? TeamStruct();
  set matchRival2(TeamStruct? val) => _matchRival2 = val;
  void updateMatchRival2(Function(TeamStruct) updateFn) =>
      updateFn(_matchRival2 ??= TeamStruct());
  bool hasMatchRival2() => _matchRival2 != null;

  // "match_for_tournament" field.
  TournamentStruct? _matchForTournament;
  TournamentStruct get matchForTournament =>
      _matchForTournament ?? TournamentStruct();
  set matchForTournament(TournamentStruct? val) => _matchForTournament = val;
  void updateMatchForTournament(Function(TournamentStruct) updateFn) =>
      updateFn(_matchForTournament ??= TournamentStruct());
  bool hasMatchForTournament() => _matchForTournament != null;

  // "match_rival1_wins" field.
  int? _matchRival1Wins;
  int get matchRival1Wins => _matchRival1Wins ?? 0;
  set matchRival1Wins(int? val) => _matchRival1Wins = val;
  void incrementMatchRival1Wins(int amount) =>
      _matchRival1Wins = matchRival1Wins + amount;
  bool hasMatchRival1Wins() => _matchRival1Wins != null;

  // "match_rival2_wins" field.
  int? _matchRival2Wins;
  int get matchRival2Wins => _matchRival2Wins ?? 0;
  set matchRival2Wins(int? val) => _matchRival2Wins = val;
  void incrementMatchRival2Wins(int amount) =>
      _matchRival2Wins = matchRival2Wins + amount;
  bool hasMatchRival2Wins() => _matchRival2Wins != null;

  static MatchStruct fromMap(Map<String, dynamic> data) => MatchStruct(
        matchId: castToType<int>(data['match_id']),
        matchPlannedDate: data['match_planned_date'] as String?,
        matchDate: data['match_date'] as String?,
        matchTournamentRound: castToType<int>(data['match_tournament_round']),
        matchTournamentPair: castToType<int>(data['match_tournament_pair']),
        matchStatus: data['match_status'] as String?,
        matchRefery: data['match_refery'] as String?,
        matchRival1: TeamStruct.maybeFromMap(data['match_rival1']),
        matchRival2: TeamStruct.maybeFromMap(data['match_rival2']),
        matchForTournament:
            TournamentStruct.maybeFromMap(data['match_for_tournament']),
        matchRival1Wins: castToType<int>(data['match_rival1_wins']),
        matchRival2Wins: castToType<int>(data['match_rival2_wins']),
      );

  static MatchStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MatchStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'match_id': _matchId,
        'match_planned_date': _matchPlannedDate,
        'match_date': _matchDate,
        'match_tournament_round': _matchTournamentRound,
        'match_tournament_pair': _matchTournamentPair,
        'match_status': _matchStatus,
        'match_refery': _matchRefery,
        'match_rival1': _matchRival1?.toMap(),
        'match_rival2': _matchRival2?.toMap(),
        'match_for_tournament': _matchForTournament?.toMap(),
        'match_rival1_wins': _matchRival1Wins,
        'match_rival2_wins': _matchRival2Wins,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'match_id': serializeParam(
          _matchId,
          ParamType.int,
        ),
        'match_planned_date': serializeParam(
          _matchPlannedDate,
          ParamType.String,
        ),
        'match_date': serializeParam(
          _matchDate,
          ParamType.String,
        ),
        'match_tournament_round': serializeParam(
          _matchTournamentRound,
          ParamType.int,
        ),
        'match_tournament_pair': serializeParam(
          _matchTournamentPair,
          ParamType.int,
        ),
        'match_status': serializeParam(
          _matchStatus,
          ParamType.String,
        ),
        'match_refery': serializeParam(
          _matchRefery,
          ParamType.String,
        ),
        'match_rival1': serializeParam(
          _matchRival1,
          ParamType.DataStruct,
        ),
        'match_rival2': serializeParam(
          _matchRival2,
          ParamType.DataStruct,
        ),
        'match_for_tournament': serializeParam(
          _matchForTournament,
          ParamType.DataStruct,
        ),
        'match_rival1_wins': serializeParam(
          _matchRival1Wins,
          ParamType.int,
        ),
        'match_rival2_wins': serializeParam(
          _matchRival2Wins,
          ParamType.int,
        ),
      }.withoutNulls;

  static MatchStruct fromSerializableMap(Map<String, dynamic> data) =>
      MatchStruct(
        matchId: deserializeParam(
          data['match_id'],
          ParamType.int,
          false,
        ),
        matchPlannedDate: deserializeParam(
          data['match_planned_date'],
          ParamType.String,
          false,
        ),
        matchDate: deserializeParam(
          data['match_date'],
          ParamType.String,
          false,
        ),
        matchTournamentRound: deserializeParam(
          data['match_tournament_round'],
          ParamType.int,
          false,
        ),
        matchTournamentPair: deserializeParam(
          data['match_tournament_pair'],
          ParamType.int,
          false,
        ),
        matchStatus: deserializeParam(
          data['match_status'],
          ParamType.String,
          false,
        ),
        matchRefery: deserializeParam(
          data['match_refery'],
          ParamType.String,
          false,
        ),
        matchRival1: deserializeStructParam(
          data['match_rival1'],
          ParamType.DataStruct,
          false,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
        matchRival2: deserializeStructParam(
          data['match_rival2'],
          ParamType.DataStruct,
          false,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
        matchForTournament: deserializeStructParam(
          data['match_for_tournament'],
          ParamType.DataStruct,
          false,
          structBuilder: TournamentStruct.fromSerializableMap,
        ),
        matchRival1Wins: deserializeParam(
          data['match_rival1_wins'],
          ParamType.int,
          false,
        ),
        matchRival2Wins: deserializeParam(
          data['match_rival2_wins'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MatchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MatchStruct &&
        matchId == other.matchId &&
        matchPlannedDate == other.matchPlannedDate &&
        matchDate == other.matchDate &&
        matchTournamentRound == other.matchTournamentRound &&
        matchTournamentPair == other.matchTournamentPair &&
        matchStatus == other.matchStatus &&
        matchRefery == other.matchRefery &&
        matchRival1 == other.matchRival1 &&
        matchRival2 == other.matchRival2 &&
        matchForTournament == other.matchForTournament &&
        matchRival1Wins == other.matchRival1Wins &&
        matchRival2Wins == other.matchRival2Wins;
  }

  @override
  int get hashCode => const ListEquality().hash([
        matchId,
        matchPlannedDate,
        matchDate,
        matchTournamentRound,
        matchTournamentPair,
        matchStatus,
        matchRefery,
        matchRival1,
        matchRival2,
        matchForTournament,
        matchRival1Wins,
        matchRival2Wins
      ]);
}

MatchStruct createMatchStruct({
  int? matchId,
  String? matchPlannedDate,
  String? matchDate,
  int? matchTournamentRound,
  int? matchTournamentPair,
  String? matchStatus,
  String? matchRefery,
  TeamStruct? matchRival1,
  TeamStruct? matchRival2,
  TournamentStruct? matchForTournament,
  int? matchRival1Wins,
  int? matchRival2Wins,
}) =>
    MatchStruct(
      matchId: matchId,
      matchPlannedDate: matchPlannedDate,
      matchDate: matchDate,
      matchTournamentRound: matchTournamentRound,
      matchTournamentPair: matchTournamentPair,
      matchStatus: matchStatus,
      matchRefery: matchRefery,
      matchRival1: matchRival1 ?? TeamStruct(),
      matchRival2: matchRival2 ?? TeamStruct(),
      matchForTournament: matchForTournament ?? TournamentStruct(),
      matchRival1Wins: matchRival1Wins,
      matchRival2Wins: matchRival2Wins,
    );
