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
    String? tournamentStatus,
    PlayerStruct? tournamentCreator,
    List<TeamStruct>? tournamentMembers,
    String? tournamentHeaderImage,
    String? tournamentStartDate,
    String? tournamentEndDate,
    String? tournamentGametype,
    int? tournamentRoundsInMatch,
    int? tournamentTeamsCount,
    List<PlayerStruct>? tournamentOrganizators,
  })  : _tournamentId = tournamentId,
        _tournamentCreatedAt = tournamentCreatedAt,
        _tournamentName = tournamentName,
        _tournamentTag = tournamentTag,
        _tournamentLogo = tournamentLogo,
        _tournamentFlag = tournamentFlag,
        _tournamentCountry = tournamentCountry,
        _tournamentStatus = tournamentStatus,
        _tournamentCreator = tournamentCreator,
        _tournamentMembers = tournamentMembers,
        _tournamentHeaderImage = tournamentHeaderImage,
        _tournamentStartDate = tournamentStartDate,
        _tournamentEndDate = tournamentEndDate,
        _tournamentGametype = tournamentGametype,
        _tournamentRoundsInMatch = tournamentRoundsInMatch,
        _tournamentTeamsCount = tournamentTeamsCount,
        _tournamentOrganizators = tournamentOrganizators;

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

  // "tournament_status" field.
  String? _tournamentStatus;
  String get tournamentStatus => _tournamentStatus ?? '';
  set tournamentStatus(String? val) => _tournamentStatus = val;
  bool hasTournamentStatus() => _tournamentStatus != null;

  // "tournament_creator" field.
  PlayerStruct? _tournamentCreator;
  PlayerStruct get tournamentCreator => _tournamentCreator ?? PlayerStruct();
  set tournamentCreator(PlayerStruct? val) => _tournamentCreator = val;
  void updateTournamentCreator(Function(PlayerStruct) updateFn) =>
      updateFn(_tournamentCreator ??= PlayerStruct());
  bool hasTournamentCreator() => _tournamentCreator != null;

  // "tournament_members" field.
  List<TeamStruct>? _tournamentMembers;
  List<TeamStruct> get tournamentMembers => _tournamentMembers ?? const [];
  set tournamentMembers(List<TeamStruct>? val) => _tournamentMembers = val;
  void updateTournamentMembers(Function(List<TeamStruct>) updateFn) =>
      updateFn(_tournamentMembers ??= []);
  bool hasTournamentMembers() => _tournamentMembers != null;

  // "tournament_header_image" field.
  String? _tournamentHeaderImage;
  String get tournamentHeaderImage => _tournamentHeaderImage ?? '';
  set tournamentHeaderImage(String? val) => _tournamentHeaderImage = val;
  bool hasTournamentHeaderImage() => _tournamentHeaderImage != null;

  // "tournament_start_date" field.
  String? _tournamentStartDate;
  String get tournamentStartDate => _tournamentStartDate ?? '';
  set tournamentStartDate(String? val) => _tournamentStartDate = val;
  bool hasTournamentStartDate() => _tournamentStartDate != null;

  // "tournament_end_date" field.
  String? _tournamentEndDate;
  String get tournamentEndDate => _tournamentEndDate ?? '';
  set tournamentEndDate(String? val) => _tournamentEndDate = val;
  bool hasTournamentEndDate() => _tournamentEndDate != null;

  // "tournament_gametype" field.
  String? _tournamentGametype;
  String get tournamentGametype => _tournamentGametype ?? '';
  set tournamentGametype(String? val) => _tournamentGametype = val;
  bool hasTournamentGametype() => _tournamentGametype != null;

  // "tournament_rounds_in_match" field.
  int? _tournamentRoundsInMatch;
  int get tournamentRoundsInMatch => _tournamentRoundsInMatch ?? 0;
  set tournamentRoundsInMatch(int? val) => _tournamentRoundsInMatch = val;
  void incrementTournamentRoundsInMatch(int amount) =>
      _tournamentRoundsInMatch = tournamentRoundsInMatch + amount;
  bool hasTournamentRoundsInMatch() => _tournamentRoundsInMatch != null;

  // "tournament_teams_count" field.
  int? _tournamentTeamsCount;
  int get tournamentTeamsCount => _tournamentTeamsCount ?? 0;
  set tournamentTeamsCount(int? val) => _tournamentTeamsCount = val;
  void incrementTournamentTeamsCount(int amount) =>
      _tournamentTeamsCount = tournamentTeamsCount + amount;
  bool hasTournamentTeamsCount() => _tournamentTeamsCount != null;

  // "tournament_organizators" field.
  List<PlayerStruct>? _tournamentOrganizators;
  List<PlayerStruct> get tournamentOrganizators =>
      _tournamentOrganizators ?? const [];
  set tournamentOrganizators(List<PlayerStruct>? val) =>
      _tournamentOrganizators = val;
  void updateTournamentOrganizators(Function(List<PlayerStruct>) updateFn) =>
      updateFn(_tournamentOrganizators ??= []);
  bool hasTournamentOrganizators() => _tournamentOrganizators != null;

  static TournamentStruct fromMap(Map<String, dynamic> data) =>
      TournamentStruct(
        tournamentId: castToType<int>(data['tournament_id']),
        tournamentCreatedAt: data['tournament_created_at'] as String?,
        tournamentName: data['tournament_name'] as String?,
        tournamentTag: data['tournament_tag'] as String?,
        tournamentLogo: data['tournament_logo'] as String?,
        tournamentFlag: data['tournament_flag'] as String?,
        tournamentCountry: data['tournament_country'] as String?,
        tournamentStatus: data['tournament_status'] as String?,
        tournamentCreator:
            PlayerStruct.maybeFromMap(data['tournament_creator']),
        tournamentMembers: getStructList(
          data['tournament_members'],
          TeamStruct.fromMap,
        ),
        tournamentHeaderImage: data['tournament_header_image'] as String?,
        tournamentStartDate: data['tournament_start_date'] as String?,
        tournamentEndDate: data['tournament_end_date'] as String?,
        tournamentGametype: data['tournament_gametype'] as String?,
        tournamentRoundsInMatch:
            castToType<int>(data['tournament_rounds_in_match']),
        tournamentTeamsCount: castToType<int>(data['tournament_teams_count']),
        tournamentOrganizators: getStructList(
          data['tournament_organizators'],
          PlayerStruct.fromMap,
        ),
      );

  static TournamentStruct? maybeFromMap(dynamic data) => data is Map
      ? TournamentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tournament_id': _tournamentId,
        'tournament_created_at': _tournamentCreatedAt,
        'tournament_name': _tournamentName,
        'tournament_tag': _tournamentTag,
        'tournament_logo': _tournamentLogo,
        'tournament_flag': _tournamentFlag,
        'tournament_country': _tournamentCountry,
        'tournament_status': _tournamentStatus,
        'tournament_creator': _tournamentCreator?.toMap(),
        'tournament_members':
            _tournamentMembers?.map((e) => e.toMap()).toList(),
        'tournament_header_image': _tournamentHeaderImage,
        'tournament_start_date': _tournamentStartDate,
        'tournament_end_date': _tournamentEndDate,
        'tournament_gametype': _tournamentGametype,
        'tournament_rounds_in_match': _tournamentRoundsInMatch,
        'tournament_teams_count': _tournamentTeamsCount,
        'tournament_organizators':
            _tournamentOrganizators?.map((e) => e.toMap()).toList(),
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
        'tournament_status': serializeParam(
          _tournamentStatus,
          ParamType.String,
        ),
        'tournament_creator': serializeParam(
          _tournamentCreator,
          ParamType.DataStruct,
        ),
        'tournament_members': serializeParam(
          _tournamentMembers,
          ParamType.DataStruct,
          true,
        ),
        'tournament_header_image': serializeParam(
          _tournamentHeaderImage,
          ParamType.String,
        ),
        'tournament_start_date': serializeParam(
          _tournamentStartDate,
          ParamType.String,
        ),
        'tournament_end_date': serializeParam(
          _tournamentEndDate,
          ParamType.String,
        ),
        'tournament_gametype': serializeParam(
          _tournamentGametype,
          ParamType.String,
        ),
        'tournament_rounds_in_match': serializeParam(
          _tournamentRoundsInMatch,
          ParamType.int,
        ),
        'tournament_teams_count': serializeParam(
          _tournamentTeamsCount,
          ParamType.int,
        ),
        'tournament_organizators': serializeParam(
          _tournamentOrganizators,
          ParamType.DataStruct,
          true,
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
        tournamentStatus: deserializeParam(
          data['tournament_status'],
          ParamType.String,
          false,
        ),
        tournamentCreator: deserializeStructParam(
          data['tournament_creator'],
          ParamType.DataStruct,
          false,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        tournamentMembers: deserializeStructParam<TeamStruct>(
          data['tournament_members'],
          ParamType.DataStruct,
          true,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
        tournamentHeaderImage: deserializeParam(
          data['tournament_header_image'],
          ParamType.String,
          false,
        ),
        tournamentStartDate: deserializeParam(
          data['tournament_start_date'],
          ParamType.String,
          false,
        ),
        tournamentEndDate: deserializeParam(
          data['tournament_end_date'],
          ParamType.String,
          false,
        ),
        tournamentGametype: deserializeParam(
          data['tournament_gametype'],
          ParamType.String,
          false,
        ),
        tournamentRoundsInMatch: deserializeParam(
          data['tournament_rounds_in_match'],
          ParamType.int,
          false,
        ),
        tournamentTeamsCount: deserializeParam(
          data['tournament_teams_count'],
          ParamType.int,
          false,
        ),
        tournamentOrganizators: deserializeStructParam<PlayerStruct>(
          data['tournament_organizators'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerStruct.fromSerializableMap,
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
        tournamentStatus == other.tournamentStatus &&
        tournamentCreator == other.tournamentCreator &&
        listEquality.equals(tournamentMembers, other.tournamentMembers) &&
        tournamentHeaderImage == other.tournamentHeaderImage &&
        tournamentStartDate == other.tournamentStartDate &&
        tournamentEndDate == other.tournamentEndDate &&
        tournamentGametype == other.tournamentGametype &&
        tournamentRoundsInMatch == other.tournamentRoundsInMatch &&
        tournamentTeamsCount == other.tournamentTeamsCount &&
        listEquality.equals(
            tournamentOrganizators, other.tournamentOrganizators);
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
        tournamentStatus,
        tournamentCreator,
        tournamentMembers,
        tournamentHeaderImage,
        tournamentStartDate,
        tournamentEndDate,
        tournamentGametype,
        tournamentRoundsInMatch,
        tournamentTeamsCount,
        tournamentOrganizators
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
  PlayerStruct? tournamentCreator,
  String? tournamentHeaderImage,
  String? tournamentStartDate,
  String? tournamentEndDate,
  String? tournamentGametype,
  int? tournamentRoundsInMatch,
  int? tournamentTeamsCount,
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
      tournamentCreator: tournamentCreator ?? PlayerStruct(),
      tournamentHeaderImage: tournamentHeaderImage,
      tournamentStartDate: tournamentStartDate,
      tournamentEndDate: tournamentEndDate,
      tournamentGametype: tournamentGametype,
      tournamentRoundsInMatch: tournamentRoundsInMatch,
      tournamentTeamsCount: tournamentTeamsCount,
    );
