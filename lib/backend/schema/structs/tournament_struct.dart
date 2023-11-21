// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TournamentStruct extends BaseStruct {
  TournamentStruct({
    int? tournamentId,
    String? tournamentCreatedAt,
    String? tournamentName,
    String? tournamentTag,
    String? tournamentLogo,
    String? tournamentFlag,
    String? tournamentCountry,
    List<int>? tournamentMembers,
    List<String>? tournamentOrganizators,
    String? tournamentStatus,
  })  : _tournamentId = tournamentId,
        _tournamentCreatedAt = tournamentCreatedAt,
        _tournamentName = tournamentName,
        _tournamentTag = tournamentTag,
        _tournamentLogo = tournamentLogo,
        _tournamentFlag = tournamentFlag,
        _tournamentCountry = tournamentCountry,
        _tournamentMembers = tournamentMembers,
        _tournamentOrganizators = tournamentOrganizators,
        _tournamentStatus = tournamentStatus;

  // "tournament_id" field.
  int? _tournamentId;
  int get tournamentId => _tournamentId ?? 0;
  set tournamentId(int? val) => _tournamentId = val;
  void incrementTournamentId(int amount) =>
      _tournamentId = tournamentId + amount;
  bool hasTournamentId() => _tournamentId != null;

  // "tournament_created_at" field.
  String? _tournamentCreatedAt;
  String get tournamentCreatedAt => _tournamentCreatedAt ?? '';
  set tournamentCreatedAt(String? val) => _tournamentCreatedAt = val;
  bool hasTournamentCreatedAt() => _tournamentCreatedAt != null;

  // "tournament_name" field.
  String? _tournamentName;
  String get tournamentName => _tournamentName ?? '';
  set tournamentName(String? val) => _tournamentName = val;
  bool hasTournamentName() => _tournamentName != null;

  // "tournament_tag" field.
  String? _tournamentTag;
  String get tournamentTag => _tournamentTag ?? '';
  set tournamentTag(String? val) => _tournamentTag = val;
  bool hasTournamentTag() => _tournamentTag != null;

  // "tournament_logo" field.
  String? _tournamentLogo;
  String get tournamentLogo => _tournamentLogo ?? '';
  set tournamentLogo(String? val) => _tournamentLogo = val;
  bool hasTournamentLogo() => _tournamentLogo != null;

  // "tournament_flag" field.
  String? _tournamentFlag;
  String get tournamentFlag => _tournamentFlag ?? '';
  set tournamentFlag(String? val) => _tournamentFlag = val;
  bool hasTournamentFlag() => _tournamentFlag != null;

  // "tournament_country" field.
  String? _tournamentCountry;
  String get tournamentCountry => _tournamentCountry ?? '';
  set tournamentCountry(String? val) => _tournamentCountry = val;
  bool hasTournamentCountry() => _tournamentCountry != null;

  // "tournament_members" field.
  List<int>? _tournamentMembers;
  List<int> get tournamentMembers => _tournamentMembers ?? const [];
  set tournamentMembers(List<int>? val) => _tournamentMembers = val;
  void updateTournamentMembers(Function(List<int>) updateFn) =>
      updateFn(_tournamentMembers ??= []);
  bool hasTournamentMembers() => _tournamentMembers != null;

  // "tournament_organizators" field.
  List<String>? _tournamentOrganizators;
  List<String> get tournamentOrganizators =>
      _tournamentOrganizators ?? const [];
  set tournamentOrganizators(List<String>? val) =>
      _tournamentOrganizators = val;
  void updateTournamentOrganizators(Function(List<String>) updateFn) =>
      updateFn(_tournamentOrganizators ??= []);
  bool hasTournamentOrganizators() => _tournamentOrganizators != null;

  // "tournament_status" field.
  String? _tournamentStatus;
  String get tournamentStatus => _tournamentStatus ?? '';
  set tournamentStatus(String? val) => _tournamentStatus = val;
  bool hasTournamentStatus() => _tournamentStatus != null;

  static TournamentStruct fromMap(Map<String, dynamic> data) =>
      TournamentStruct(
        tournamentId: castToType<int>(data['tournament_id']),
        tournamentCreatedAt: data['tournament_created_at'] as String?,
        tournamentName: data['tournament_name'] as String?,
        tournamentTag: data['tournament_tag'] as String?,
        tournamentLogo: data['tournament_logo'] as String?,
        tournamentFlag: data['tournament_flag'] as String?,
        tournamentCountry: data['tournament_country'] as String?,
        tournamentMembers: getDataList(data['tournament_members']),
        tournamentOrganizators: getDataList(data['tournament_organizators']),
        tournamentStatus: data['tournament_status'] as String?,
      );

  static TournamentStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TournamentStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'tournament_id': _tournamentId,
        'tournament_created_at': _tournamentCreatedAt,
        'tournament_name': _tournamentName,
        'tournament_tag': _tournamentTag,
        'tournament_logo': _tournamentLogo,
        'tournament_flag': _tournamentFlag,
        'tournament_country': _tournamentCountry,
        'tournament_members': _tournamentMembers,
        'tournament_organizators': _tournamentOrganizators,
        'tournament_status': _tournamentStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tournament_id': serializeParam(
          _tournamentId,
          ParamType.int,
        ),
        'tournament_created_at': serializeParam(
          _tournamentCreatedAt,
          ParamType.String,
        ),
        'tournament_name': serializeParam(
          _tournamentName,
          ParamType.String,
        ),
        'tournament_tag': serializeParam(
          _tournamentTag,
          ParamType.String,
        ),
        'tournament_logo': serializeParam(
          _tournamentLogo,
          ParamType.String,
        ),
        'tournament_flag': serializeParam(
          _tournamentFlag,
          ParamType.String,
        ),
        'tournament_country': serializeParam(
          _tournamentCountry,
          ParamType.String,
        ),
        'tournament_members': serializeParam(
          _tournamentMembers,
          ParamType.int,
          true,
        ),
        'tournament_organizators': serializeParam(
          _tournamentOrganizators,
          ParamType.String,
          true,
        ),
        'tournament_status': serializeParam(
          _tournamentStatus,
          ParamType.String,
        ),
      }.withoutNulls;

  static TournamentStruct fromSerializableMap(Map<String, dynamic> data) =>
      TournamentStruct(
        tournamentId: deserializeParam(
          data['tournament_id'],
          ParamType.int,
          false,
        ),
        tournamentCreatedAt: deserializeParam(
          data['tournament_created_at'],
          ParamType.String,
          false,
        ),
        tournamentName: deserializeParam(
          data['tournament_name'],
          ParamType.String,
          false,
        ),
        tournamentTag: deserializeParam(
          data['tournament_tag'],
          ParamType.String,
          false,
        ),
        tournamentLogo: deserializeParam(
          data['tournament_logo'],
          ParamType.String,
          false,
        ),
        tournamentFlag: deserializeParam(
          data['tournament_flag'],
          ParamType.String,
          false,
        ),
        tournamentCountry: deserializeParam(
          data['tournament_country'],
          ParamType.String,
          false,
        ),
        tournamentMembers: deserializeParam<int>(
          data['tournament_members'],
          ParamType.int,
          true,
        ),
        tournamentOrganizators: deserializeParam<String>(
          data['tournament_organizators'],
          ParamType.String,
          true,
        ),
        tournamentStatus: deserializeParam(
          data['tournament_status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TournamentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TournamentStruct &&
        tournamentId == other.tournamentId &&
        tournamentCreatedAt == other.tournamentCreatedAt &&
        tournamentName == other.tournamentName &&
        tournamentTag == other.tournamentTag &&
        tournamentLogo == other.tournamentLogo &&
        tournamentFlag == other.tournamentFlag &&
        tournamentCountry == other.tournamentCountry &&
        listEquality.equals(tournamentMembers, other.tournamentMembers) &&
        listEquality.equals(
            tournamentOrganizators, other.tournamentOrganizators) &&
        tournamentStatus == other.tournamentStatus;
  }

  @override
  int get hashCode => const ListEquality().hash([
        tournamentId,
        tournamentCreatedAt,
        tournamentName,
        tournamentTag,
        tournamentLogo,
        tournamentFlag,
        tournamentCountry,
        tournamentMembers,
        tournamentOrganizators,
        tournamentStatus
      ]);
}

TournamentStruct createTournamentStruct({
  int? tournamentId,
  String? tournamentCreatedAt,
  String? tournamentName,
  String? tournamentTag,
  String? tournamentLogo,
  String? tournamentFlag,
  String? tournamentCountry,
  String? tournamentStatus,
}) =>
    TournamentStruct(
      tournamentId: tournamentId,
      tournamentCreatedAt: tournamentCreatedAt,
      tournamentName: tournamentName,
      tournamentTag: tournamentTag,
      tournamentLogo: tournamentLogo,
      tournamentFlag: tournamentFlag,
      tournamentCountry: tournamentCountry,
      tournamentStatus: tournamentStatus,
    );
