// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayerStruct extends BaseStruct {
  PlayerStruct({
    String? playerCreatedAt,
    String? playerNickname,
    String? playerTag,
    String? playerFlag,
    String? playerCountrie,
    String? playerAvatar,
    String? playerUid,
    int? playerTeam,
    String? playerTeamRole,
    bool? playerTeamLineup,
    int? playerId,
  })  : _playerCreatedAt = playerCreatedAt,
        _playerNickname = playerNickname,
        _playerTag = playerTag,
        _playerFlag = playerFlag,
        _playerCountrie = playerCountrie,
        _playerAvatar = playerAvatar,
        _playerUid = playerUid,
        _playerTeam = playerTeam,
        _playerTeamRole = playerTeamRole,
        _playerTeamLineup = playerTeamLineup,
        _playerId = playerId;

  // "player_created_at" field.
  String? _playerCreatedAt;
  String get playerCreatedAt => _playerCreatedAt ?? '';
  set playerCreatedAt(String? val) => _playerCreatedAt = val;
  bool hasPlayerCreatedAt() => _playerCreatedAt != null;

  // "player_nickname" field.
  String? _playerNickname;
  String get playerNickname => _playerNickname ?? '';
  set playerNickname(String? val) => _playerNickname = val;
  bool hasPlayerNickname() => _playerNickname != null;

  // "player_tag" field.
  String? _playerTag;
  String get playerTag => _playerTag ?? '';
  set playerTag(String? val) => _playerTag = val;
  bool hasPlayerTag() => _playerTag != null;

  // "player_flag" field.
  String? _playerFlag;
  String get playerFlag => _playerFlag ?? '';
  set playerFlag(String? val) => _playerFlag = val;
  bool hasPlayerFlag() => _playerFlag != null;

  // "player_countrie" field.
  String? _playerCountrie;
  String get playerCountrie => _playerCountrie ?? '';
  set playerCountrie(String? val) => _playerCountrie = val;
  bool hasPlayerCountrie() => _playerCountrie != null;

  // "player_avatar" field.
  String? _playerAvatar;
  String get playerAvatar => _playerAvatar ?? '';
  set playerAvatar(String? val) => _playerAvatar = val;
  bool hasPlayerAvatar() => _playerAvatar != null;

  // "player_uid" field.
  String? _playerUid;
  String get playerUid => _playerUid ?? '';
  set playerUid(String? val) => _playerUid = val;
  bool hasPlayerUid() => _playerUid != null;

  // "player_team" field.
  int? _playerTeam;
  int get playerTeam => _playerTeam ?? 0;
  set playerTeam(int? val) => _playerTeam = val;
  void incrementPlayerTeam(int amount) => _playerTeam = playerTeam + amount;
  bool hasPlayerTeam() => _playerTeam != null;

  // "player_team_role" field.
  String? _playerTeamRole;
  String get playerTeamRole => _playerTeamRole ?? '';
  set playerTeamRole(String? val) => _playerTeamRole = val;
  bool hasPlayerTeamRole() => _playerTeamRole != null;

  // "player_team_lineup" field.
  bool? _playerTeamLineup;
  bool get playerTeamLineup => _playerTeamLineup ?? false;
  set playerTeamLineup(bool? val) => _playerTeamLineup = val;
  bool hasPlayerTeamLineup() => _playerTeamLineup != null;

  // "player_id" field.
  int? _playerId;
  int get playerId => _playerId ?? 0;
  set playerId(int? val) => _playerId = val;
  void incrementPlayerId(int amount) => _playerId = playerId + amount;
  bool hasPlayerId() => _playerId != null;

  static PlayerStruct fromMap(Map<String, dynamic> data) => PlayerStruct(
        playerCreatedAt: data['player_created_at'] as String?,
        playerNickname: data['player_nickname'] as String?,
        playerTag: data['player_tag'] as String?,
        playerFlag: data['player_flag'] as String?,
        playerCountrie: data['player_countrie'] as String?,
        playerAvatar: data['player_avatar'] as String?,
        playerUid: data['player_uid'] as String?,
        playerTeam: castToType<int>(data['player_team']),
        playerTeamRole: data['player_team_role'] as String?,
        playerTeamLineup: data['player_team_lineup'] as bool?,
        playerId: castToType<int>(data['player_id']),
      );

  static PlayerStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlayerStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'player_created_at': _playerCreatedAt,
        'player_nickname': _playerNickname,
        'player_tag': _playerTag,
        'player_flag': _playerFlag,
        'player_countrie': _playerCountrie,
        'player_avatar': _playerAvatar,
        'player_uid': _playerUid,
        'player_team': _playerTeam,
        'player_team_role': _playerTeamRole,
        'player_team_lineup': _playerTeamLineup,
        'player_id': _playerId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'player_created_at': serializeParam(
          _playerCreatedAt,
          ParamType.String,
        ),
        'player_nickname': serializeParam(
          _playerNickname,
          ParamType.String,
        ),
        'player_tag': serializeParam(
          _playerTag,
          ParamType.String,
        ),
        'player_flag': serializeParam(
          _playerFlag,
          ParamType.String,
        ),
        'player_countrie': serializeParam(
          _playerCountrie,
          ParamType.String,
        ),
        'player_avatar': serializeParam(
          _playerAvatar,
          ParamType.String,
        ),
        'player_uid': serializeParam(
          _playerUid,
          ParamType.String,
        ),
        'player_team': serializeParam(
          _playerTeam,
          ParamType.int,
        ),
        'player_team_role': serializeParam(
          _playerTeamRole,
          ParamType.String,
        ),
        'player_team_lineup': serializeParam(
          _playerTeamLineup,
          ParamType.bool,
        ),
        'player_id': serializeParam(
          _playerId,
          ParamType.int,
        ),
      }.withoutNulls;

  static PlayerStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayerStruct(
        playerCreatedAt: deserializeParam(
          data['player_created_at'],
          ParamType.String,
          false,
        ),
        playerNickname: deserializeParam(
          data['player_nickname'],
          ParamType.String,
          false,
        ),
        playerTag: deserializeParam(
          data['player_tag'],
          ParamType.String,
          false,
        ),
        playerFlag: deserializeParam(
          data['player_flag'],
          ParamType.String,
          false,
        ),
        playerCountrie: deserializeParam(
          data['player_countrie'],
          ParamType.String,
          false,
        ),
        playerAvatar: deserializeParam(
          data['player_avatar'],
          ParamType.String,
          false,
        ),
        playerUid: deserializeParam(
          data['player_uid'],
          ParamType.String,
          false,
        ),
        playerTeam: deserializeParam(
          data['player_team'],
          ParamType.int,
          false,
        ),
        playerTeamRole: deserializeParam(
          data['player_team_role'],
          ParamType.String,
          false,
        ),
        playerTeamLineup: deserializeParam(
          data['player_team_lineup'],
          ParamType.bool,
          false,
        ),
        playerId: deserializeParam(
          data['player_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PlayerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlayerStruct &&
        playerCreatedAt == other.playerCreatedAt &&
        playerNickname == other.playerNickname &&
        playerTag == other.playerTag &&
        playerFlag == other.playerFlag &&
        playerCountrie == other.playerCountrie &&
        playerAvatar == other.playerAvatar &&
        playerUid == other.playerUid &&
        playerTeam == other.playerTeam &&
        playerTeamRole == other.playerTeamRole &&
        playerTeamLineup == other.playerTeamLineup &&
        playerId == other.playerId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        playerCreatedAt,
        playerNickname,
        playerTag,
        playerFlag,
        playerCountrie,
        playerAvatar,
        playerUid,
        playerTeam,
        playerTeamRole,
        playerTeamLineup,
        playerId
      ]);
}

PlayerStruct createPlayerStruct({
  String? playerCreatedAt,
  String? playerNickname,
  String? playerTag,
  String? playerFlag,
  String? playerCountrie,
  String? playerAvatar,
  String? playerUid,
  int? playerTeam,
  String? playerTeamRole,
  bool? playerTeamLineup,
  int? playerId,
}) =>
    PlayerStruct(
      playerCreatedAt: playerCreatedAt,
      playerNickname: playerNickname,
      playerTag: playerTag,
      playerFlag: playerFlag,
      playerCountrie: playerCountrie,
      playerAvatar: playerAvatar,
      playerUid: playerUid,
      playerTeam: playerTeam,
      playerTeamRole: playerTeamRole,
      playerTeamLineup: playerTeamLineup,
      playerId: playerId,
    );
