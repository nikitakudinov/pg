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
        _teamChatId = teamChatId;

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
      );

  static TeamStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TeamStruct.fromMap(data) : null;

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
        teamChatId == other.teamChatId;
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
        teamChatId
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
    );
