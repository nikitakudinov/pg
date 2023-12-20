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
        _tournamentHeaderImage = tournamentHeaderImage;

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
        'tournament_status': _tournamentStatus,
        'tournament_creator': _tournamentCreator?.toMap(),
        'tournament_members':
            _tournamentMembers?.map((e) => e.toMap()).toList(),
        'tournament_header_image': _tournamentHeaderImage,
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
        tournamentHeaderImage == other.tournamentHeaderImage;
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
        tournamentHeaderImage
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
    );
