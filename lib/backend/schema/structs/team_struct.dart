// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamStruct extends BaseStruct {
  TeamStruct({
    String? teamCreatedAt,
    String? teamUpdatedAt,
    String? teamName,
    String? teamTag,
    String? teamFlag,
    String? teamCountry,
    String? teamCreator,
    String? teamLogo,
    bool? teamRecruitment,
    String? teamStatus,
    int? teamId,
    int? teamChatId,
    int? teamMatchesCount,
    int? teamMatchWins,
    int? teamMatchLoses,
    int? teamMatchesRoundsCount,
    int? teamMatchRoundWins,
    int? teamMatchRoundLoses,
    double? teamWLmatches,
    String? teamHeader,
  })  : _teamCreatedAt = teamCreatedAt,
        _teamUpdatedAt = teamUpdatedAt,
        _teamName = teamName,
        _teamTag = teamTag,
        _teamFlag = teamFlag,
        _teamCountry = teamCountry,
        _teamCreator = teamCreator,
        _teamLogo = teamLogo,
        _teamRecruitment = teamRecruitment,
        _teamStatus = teamStatus,
        _teamId = teamId,
        _teamChatId = teamChatId,
        _teamMatchesCount = teamMatchesCount,
        _teamMatchWins = teamMatchWins,
        _teamMatchLoses = teamMatchLoses,
        _teamMatchesRoundsCount = teamMatchesRoundsCount,
        _teamMatchRoundWins = teamMatchRoundWins,
        _teamMatchRoundLoses = teamMatchRoundLoses,
        _teamWLmatches = teamWLmatches,
        _teamHeader = teamHeader;

  // "team_created_at" field.
  String? _teamCreatedAt;
  String get teamCreatedAt => _teamCreatedAt ?? '';
  set teamCreatedAt(String? val) => _teamCreatedAt = val;
  bool hasTeamCreatedAt() => _teamCreatedAt != null;

  // "team_updated_at" field.
  String? _teamUpdatedAt;
  String get teamUpdatedAt => _teamUpdatedAt ?? '';
  set teamUpdatedAt(String? val) => _teamUpdatedAt = val;
  bool hasTeamUpdatedAt() => _teamUpdatedAt != null;

  // "team_name" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  set teamName(String? val) => _teamName = val;
  bool hasTeamName() => _teamName != null;

  // "team_tag" field.
  String? _teamTag;
  String get teamTag => _teamTag ?? '';
  set teamTag(String? val) => _teamTag = val;
  bool hasTeamTag() => _teamTag != null;

  // "team_flag" field.
  String? _teamFlag;
  String get teamFlag => _teamFlag ?? '';
  set teamFlag(String? val) => _teamFlag = val;
  bool hasTeamFlag() => _teamFlag != null;

  // "team_country" field.
  String? _teamCountry;
  String get teamCountry => _teamCountry ?? '';
  set teamCountry(String? val) => _teamCountry = val;
  bool hasTeamCountry() => _teamCountry != null;

  // "team_creator" field.
  String? _teamCreator;
  String get teamCreator => _teamCreator ?? '';
  set teamCreator(String? val) => _teamCreator = val;
  bool hasTeamCreator() => _teamCreator != null;

  // "team_logo" field.
  String? _teamLogo;
  String get teamLogo => _teamLogo ?? '';
  set teamLogo(String? val) => _teamLogo = val;
  bool hasTeamLogo() => _teamLogo != null;

  // "team_recruitment" field.
  bool? _teamRecruitment;
  bool get teamRecruitment => _teamRecruitment ?? false;
  set teamRecruitment(bool? val) => _teamRecruitment = val;
  bool hasTeamRecruitment() => _teamRecruitment != null;

  // "team_status" field.
  String? _teamStatus;
  String get teamStatus => _teamStatus ?? '';
  set teamStatus(String? val) => _teamStatus = val;
  bool hasTeamStatus() => _teamStatus != null;

  // "team_id" field.
  int? _teamId;
  int get teamId => _teamId ?? 0;
  set teamId(int? val) => _teamId = val;
  void incrementTeamId(int amount) => _teamId = teamId + amount;
  bool hasTeamId() => _teamId != null;

  // "team_chat_id" field.
  int? _teamChatId;
  int get teamChatId => _teamChatId ?? 0;
  set teamChatId(int? val) => _teamChatId = val;
  void incrementTeamChatId(int amount) => _teamChatId = teamChatId + amount;
  bool hasTeamChatId() => _teamChatId != null;

  // "team_matches_count" field.
  int? _teamMatchesCount;
  int get teamMatchesCount => _teamMatchesCount ?? 0;
  set teamMatchesCount(int? val) => _teamMatchesCount = val;
  void incrementTeamMatchesCount(int amount) =>
      _teamMatchesCount = teamMatchesCount + amount;
  bool hasTeamMatchesCount() => _teamMatchesCount != null;

  // "team_match_wins" field.
  int? _teamMatchWins;
  int get teamMatchWins => _teamMatchWins ?? 0;
  set teamMatchWins(int? val) => _teamMatchWins = val;
  void incrementTeamMatchWins(int amount) =>
      _teamMatchWins = teamMatchWins + amount;
  bool hasTeamMatchWins() => _teamMatchWins != null;

  // "team_match_loses" field.
  int? _teamMatchLoses;
  int get teamMatchLoses => _teamMatchLoses ?? 0;
  set teamMatchLoses(int? val) => _teamMatchLoses = val;
  void incrementTeamMatchLoses(int amount) =>
      _teamMatchLoses = teamMatchLoses + amount;
  bool hasTeamMatchLoses() => _teamMatchLoses != null;

  // "team_matches_rounds_count" field.
  int? _teamMatchesRoundsCount;
  int get teamMatchesRoundsCount => _teamMatchesRoundsCount ?? 0;
  set teamMatchesRoundsCount(int? val) => _teamMatchesRoundsCount = val;
  void incrementTeamMatchesRoundsCount(int amount) =>
      _teamMatchesRoundsCount = teamMatchesRoundsCount + amount;
  bool hasTeamMatchesRoundsCount() => _teamMatchesRoundsCount != null;

  // "team_match_round_wins" field.
  int? _teamMatchRoundWins;
  int get teamMatchRoundWins => _teamMatchRoundWins ?? 0;
  set teamMatchRoundWins(int? val) => _teamMatchRoundWins = val;
  void incrementTeamMatchRoundWins(int amount) =>
      _teamMatchRoundWins = teamMatchRoundWins + amount;
  bool hasTeamMatchRoundWins() => _teamMatchRoundWins != null;

  // "team_match_round_loses" field.
  int? _teamMatchRoundLoses;
  int get teamMatchRoundLoses => _teamMatchRoundLoses ?? 0;
  set teamMatchRoundLoses(int? val) => _teamMatchRoundLoses = val;
  void incrementTeamMatchRoundLoses(int amount) =>
      _teamMatchRoundLoses = teamMatchRoundLoses + amount;
  bool hasTeamMatchRoundLoses() => _teamMatchRoundLoses != null;

  // "team_WLmatches" field.
  double? _teamWLmatches;
  double get teamWLmatches => _teamWLmatches ?? 0.0;
  set teamWLmatches(double? val) => _teamWLmatches = val;
  void incrementTeamWLmatches(double amount) =>
      _teamWLmatches = teamWLmatches + amount;
  bool hasTeamWLmatches() => _teamWLmatches != null;

  // "team_header" field.
  String? _teamHeader;
  String get teamHeader => _teamHeader ?? '';
  set teamHeader(String? val) => _teamHeader = val;
  bool hasTeamHeader() => _teamHeader != null;

  static TeamStruct fromMap(Map<String, dynamic> data) => TeamStruct(
        teamCreatedAt: data['team_created_at'] as String?,
        teamUpdatedAt: data['team_updated_at'] as String?,
        teamName: data['team_name'] as String?,
        teamTag: data['team_tag'] as String?,
        teamFlag: data['team_flag'] as String?,
        teamCountry: data['team_country'] as String?,
        teamCreator: data['team_creator'] as String?,
        teamLogo: data['team_logo'] as String?,
        teamRecruitment: data['team_recruitment'] as bool?,
        teamStatus: data['team_status'] as String?,
        teamId: castToType<int>(data['team_id']),
        teamChatId: castToType<int>(data['team_chat_id']),
        teamMatchesCount: castToType<int>(data['team_matches_count']),
        teamMatchWins: castToType<int>(data['team_match_wins']),
        teamMatchLoses: castToType<int>(data['team_match_loses']),
        teamMatchesRoundsCount:
            castToType<int>(data['team_matches_rounds_count']),
        teamMatchRoundWins: castToType<int>(data['team_match_round_wins']),
        teamMatchRoundLoses: castToType<int>(data['team_match_round_loses']),
        teamWLmatches: castToType<double>(data['team_WLmatches']),
        teamHeader: data['team_header'] as String?,
      );

  static TeamStruct? maybeFromMap(dynamic data) =>
      data is Map ? TeamStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'team_created_at': _teamCreatedAt,
        'team_updated_at': _teamUpdatedAt,
        'team_name': _teamName,
        'team_tag': _teamTag,
        'team_flag': _teamFlag,
        'team_country': _teamCountry,
        'team_creator': _teamCreator,
        'team_logo': _teamLogo,
        'team_recruitment': _teamRecruitment,
        'team_status': _teamStatus,
        'team_id': _teamId,
        'team_chat_id': _teamChatId,
        'team_matches_count': _teamMatchesCount,
        'team_match_wins': _teamMatchWins,
        'team_match_loses': _teamMatchLoses,
        'team_matches_rounds_count': _teamMatchesRoundsCount,
        'team_match_round_wins': _teamMatchRoundWins,
        'team_match_round_loses': _teamMatchRoundLoses,
        'team_WLmatches': _teamWLmatches,
        'team_header': _teamHeader,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'team_created_at': serializeParam(
          _teamCreatedAt,
          ParamType.String,
        ),
        'team_updated_at': serializeParam(
          _teamUpdatedAt,
          ParamType.String,
        ),
        'team_name': serializeParam(
          _teamName,
          ParamType.String,
        ),
        'team_tag': serializeParam(
          _teamTag,
          ParamType.String,
        ),
        'team_flag': serializeParam(
          _teamFlag,
          ParamType.String,
        ),
        'team_country': serializeParam(
          _teamCountry,
          ParamType.String,
        ),
        'team_creator': serializeParam(
          _teamCreator,
          ParamType.String,
        ),
        'team_logo': serializeParam(
          _teamLogo,
          ParamType.String,
        ),
        'team_recruitment': serializeParam(
          _teamRecruitment,
          ParamType.bool,
        ),
        'team_status': serializeParam(
          _teamStatus,
          ParamType.String,
        ),
        'team_id': serializeParam(
          _teamId,
          ParamType.int,
        ),
        'team_chat_id': serializeParam(
          _teamChatId,
          ParamType.int,
        ),
        'team_matches_count': serializeParam(
          _teamMatchesCount,
          ParamType.int,
        ),
        'team_match_wins': serializeParam(
          _teamMatchWins,
          ParamType.int,
        ),
        'team_match_loses': serializeParam(
          _teamMatchLoses,
          ParamType.int,
        ),
        'team_matches_rounds_count': serializeParam(
          _teamMatchesRoundsCount,
          ParamType.int,
        ),
        'team_match_round_wins': serializeParam(
          _teamMatchRoundWins,
          ParamType.int,
        ),
        'team_match_round_loses': serializeParam(
          _teamMatchRoundLoses,
          ParamType.int,
        ),
        'team_WLmatches': serializeParam(
          _teamWLmatches,
          ParamType.double,
        ),
        'team_header': serializeParam(
          _teamHeader,
          ParamType.String,
        ),
      }.withoutNulls;

  static TeamStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamStruct(
        teamCreatedAt: deserializeParam(
          data['team_created_at'],
          ParamType.String,
          false,
        ),
        teamUpdatedAt: deserializeParam(
          data['team_updated_at'],
          ParamType.String,
          false,
        ),
        teamName: deserializeParam(
          data['team_name'],
          ParamType.String,
          false,
        ),
        teamTag: deserializeParam(
          data['team_tag'],
          ParamType.String,
          false,
        ),
        teamFlag: deserializeParam(
          data['team_flag'],
          ParamType.String,
          false,
        ),
        teamCountry: deserializeParam(
          data['team_country'],
          ParamType.String,
          false,
        ),
        teamCreator: deserializeParam(
          data['team_creator'],
          ParamType.String,
          false,
        ),
        teamLogo: deserializeParam(
          data['team_logo'],
          ParamType.String,
          false,
        ),
        teamRecruitment: deserializeParam(
          data['team_recruitment'],
          ParamType.bool,
          false,
        ),
        teamStatus: deserializeParam(
          data['team_status'],
          ParamType.String,
          false,
        ),
        teamId: deserializeParam(
          data['team_id'],
          ParamType.int,
          false,
        ),
        teamChatId: deserializeParam(
          data['team_chat_id'],
          ParamType.int,
          false,
        ),
        teamMatchesCount: deserializeParam(
          data['team_matches_count'],
          ParamType.int,
          false,
        ),
        teamMatchWins: deserializeParam(
          data['team_match_wins'],
          ParamType.int,
          false,
        ),
        teamMatchLoses: deserializeParam(
          data['team_match_loses'],
          ParamType.int,
          false,
        ),
        teamMatchesRoundsCount: deserializeParam(
          data['team_matches_rounds_count'],
          ParamType.int,
          false,
        ),
        teamMatchRoundWins: deserializeParam(
          data['team_match_round_wins'],
          ParamType.int,
          false,
        ),
        teamMatchRoundLoses: deserializeParam(
          data['team_match_round_loses'],
          ParamType.int,
          false,
        ),
        teamWLmatches: deserializeParam(
          data['team_WLmatches'],
          ParamType.double,
          false,
        ),
        teamHeader: deserializeParam(
          data['team_header'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TeamStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeamStruct &&
        teamCreatedAt == other.teamCreatedAt &&
        teamUpdatedAt == other.teamUpdatedAt &&
        teamName == other.teamName &&
        teamTag == other.teamTag &&
        teamFlag == other.teamFlag &&
        teamCountry == other.teamCountry &&
        teamCreator == other.teamCreator &&
        teamLogo == other.teamLogo &&
        teamRecruitment == other.teamRecruitment &&
        teamStatus == other.teamStatus &&
        teamId == other.teamId &&
        teamChatId == other.teamChatId &&
        teamMatchesCount == other.teamMatchesCount &&
        teamMatchWins == other.teamMatchWins &&
        teamMatchLoses == other.teamMatchLoses &&
        teamMatchesRoundsCount == other.teamMatchesRoundsCount &&
        teamMatchRoundWins == other.teamMatchRoundWins &&
        teamMatchRoundLoses == other.teamMatchRoundLoses &&
        teamWLmatches == other.teamWLmatches &&
        teamHeader == other.teamHeader;
  }

  @override
  int get hashCode => const ListEquality().hash([
        teamCreatedAt,
        teamUpdatedAt,
        teamName,
        teamTag,
        teamFlag,
        teamCountry,
        teamCreator,
        teamLogo,
        teamRecruitment,
        teamStatus,
        teamId,
        teamChatId,
        teamMatchesCount,
        teamMatchWins,
        teamMatchLoses,
        teamMatchesRoundsCount,
        teamMatchRoundWins,
        teamMatchRoundLoses,
        teamWLmatches,
        teamHeader
      ]);
}

TeamStruct createTeamStruct({
  String? teamCreatedAt,
  String? teamUpdatedAt,
  String? teamName,
  String? teamTag,
  String? teamFlag,
  String? teamCountry,
  String? teamCreator,
  String? teamLogo,
  bool? teamRecruitment,
  String? teamStatus,
  int? teamId,
  int? teamChatId,
  int? teamMatchesCount,
  int? teamMatchWins,
  int? teamMatchLoses,
  int? teamMatchesRoundsCount,
  int? teamMatchRoundWins,
  int? teamMatchRoundLoses,
  double? teamWLmatches,
  String? teamHeader,
}) =>
    TeamStruct(
      teamCreatedAt: teamCreatedAt,
      teamUpdatedAt: teamUpdatedAt,
      teamName: teamName,
      teamTag: teamTag,
      teamFlag: teamFlag,
      teamCountry: teamCountry,
      teamCreator: teamCreator,
      teamLogo: teamLogo,
      teamRecruitment: teamRecruitment,
      teamStatus: teamStatus,
      teamId: teamId,
      teamChatId: teamChatId,
      teamMatchesCount: teamMatchesCount,
      teamMatchWins: teamMatchWins,
      teamMatchLoses: teamMatchLoses,
      teamMatchesRoundsCount: teamMatchesRoundsCount,
      teamMatchRoundWins: teamMatchRoundWins,
      teamMatchRoundLoses: teamMatchRoundLoses,
      teamWLmatches: teamWLmatches,
      teamHeader: teamHeader,
    );
