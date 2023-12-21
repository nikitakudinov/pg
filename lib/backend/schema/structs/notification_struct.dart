// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationStruct extends BaseStruct {
  NotificationStruct({
    int? notificationId,
    TeamStruct? notificationFromTeam,
    PlayerStruct? notificationFromPlayer,
    TournamentStruct? notificationFromTournament,
    String? notificationType,
    String? notificationBody,
    String? notificationToPlayer,
    String? notificationCategory,
    String? notificationCreatedAt,
  })  : _notificationId = notificationId,
        _notificationFromTeam = notificationFromTeam,
        _notificationFromPlayer = notificationFromPlayer,
        _notificationFromTournament = notificationFromTournament,
        _notificationType = notificationType,
        _notificationBody = notificationBody,
        _notificationToPlayer = notificationToPlayer,
        _notificationCategory = notificationCategory,
        _notificationCreatedAt = notificationCreatedAt;

  // "notification_id" field.
  int? _notificationId;
  int get notificationId => _notificationId ?? 0;
  set notificationId(int? val) => _notificationId = val;
  void incrementNotificationId(int amount) =>
      _notificationId = notificationId + amount;
  bool hasNotificationId() => _notificationId != null;

  // "notification_from_team" field.
  TeamStruct? _notificationFromTeam;
  TeamStruct get notificationFromTeam => _notificationFromTeam ?? TeamStruct();
  set notificationFromTeam(TeamStruct? val) => _notificationFromTeam = val;
  void updateNotificationFromTeam(Function(TeamStruct) updateFn) =>
      updateFn(_notificationFromTeam ??= TeamStruct());
  bool hasNotificationFromTeam() => _notificationFromTeam != null;

  // "notification_from_player" field.
  PlayerStruct? _notificationFromPlayer;
  PlayerStruct get notificationFromPlayer =>
      _notificationFromPlayer ?? PlayerStruct();
  set notificationFromPlayer(PlayerStruct? val) =>
      _notificationFromPlayer = val;
  void updateNotificationFromPlayer(Function(PlayerStruct) updateFn) =>
      updateFn(_notificationFromPlayer ??= PlayerStruct());
  bool hasNotificationFromPlayer() => _notificationFromPlayer != null;

  // "notification_from_tournament" field.
  TournamentStruct? _notificationFromTournament;
  TournamentStruct get notificationFromTournament =>
      _notificationFromTournament ?? TournamentStruct();
  set notificationFromTournament(TournamentStruct? val) =>
      _notificationFromTournament = val;
  void updateNotificationFromTournament(Function(TournamentStruct) updateFn) =>
      updateFn(_notificationFromTournament ??= TournamentStruct());
  bool hasNotificationFromTournament() => _notificationFromTournament != null;

  // "notification_type" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  set notificationType(String? val) => _notificationType = val;
  bool hasNotificationType() => _notificationType != null;

  // "notification_body" field.
  String? _notificationBody;
  String get notificationBody => _notificationBody ?? '';
  set notificationBody(String? val) => _notificationBody = val;
  bool hasNotificationBody() => _notificationBody != null;

  // "notification_to_player" field.
  String? _notificationToPlayer;
  String get notificationToPlayer => _notificationToPlayer ?? '';
  set notificationToPlayer(String? val) => _notificationToPlayer = val;
  bool hasNotificationToPlayer() => _notificationToPlayer != null;

  // "notification_category" field.
  String? _notificationCategory;
  String get notificationCategory => _notificationCategory ?? '';
  set notificationCategory(String? val) => _notificationCategory = val;
  bool hasNotificationCategory() => _notificationCategory != null;

  // "notification_created_at" field.
  String? _notificationCreatedAt;
  String get notificationCreatedAt => _notificationCreatedAt ?? '';
  set notificationCreatedAt(String? val) => _notificationCreatedAt = val;
  bool hasNotificationCreatedAt() => _notificationCreatedAt != null;

  static NotificationStruct fromMap(Map<String, dynamic> data) =>
      NotificationStruct(
        notificationId: castToType<int>(data['notification_id']),
        notificationFromTeam:
            TeamStruct.maybeFromMap(data['notification_from_team']),
        notificationFromPlayer:
            PlayerStruct.maybeFromMap(data['notification_from_player']),
        notificationFromTournament:
            TournamentStruct.maybeFromMap(data['notification_from_tournament']),
        notificationType: data['notification_type'] as String?,
        notificationBody: data['notification_body'] as String?,
        notificationToPlayer: data['notification_to_player'] as String?,
        notificationCategory: data['notification_category'] as String?,
        notificationCreatedAt: data['notification_created_at'] as String?,
      );

  static NotificationStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'notification_id': _notificationId,
        'notification_from_team': _notificationFromTeam?.toMap(),
        'notification_from_player': _notificationFromPlayer?.toMap(),
        'notification_from_tournament': _notificationFromTournament?.toMap(),
        'notification_type': _notificationType,
        'notification_body': _notificationBody,
        'notification_to_player': _notificationToPlayer,
        'notification_category': _notificationCategory,
        'notification_created_at': _notificationCreatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'notification_id': serializeParam(
          _notificationId,
          ParamType.int,
        ),
        'notification_from_team': serializeParam(
          _notificationFromTeam,
          ParamType.DataStruct,
        ),
        'notification_from_player': serializeParam(
          _notificationFromPlayer,
          ParamType.DataStruct,
        ),
        'notification_from_tournament': serializeParam(
          _notificationFromTournament,
          ParamType.DataStruct,
        ),
        'notification_type': serializeParam(
          _notificationType,
          ParamType.String,
        ),
        'notification_body': serializeParam(
          _notificationBody,
          ParamType.String,
        ),
        'notification_to_player': serializeParam(
          _notificationToPlayer,
          ParamType.String,
        ),
        'notification_category': serializeParam(
          _notificationCategory,
          ParamType.String,
        ),
        'notification_created_at': serializeParam(
          _notificationCreatedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationStruct(
        notificationId: deserializeParam(
          data['notification_id'],
          ParamType.int,
          false,
        ),
        notificationFromTeam: deserializeStructParam(
          data['notification_from_team'],
          ParamType.DataStruct,
          false,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
        notificationFromPlayer: deserializeStructParam(
          data['notification_from_player'],
          ParamType.DataStruct,
          false,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        notificationFromTournament: deserializeStructParam(
          data['notification_from_tournament'],
          ParamType.DataStruct,
          false,
          structBuilder: TournamentStruct.fromSerializableMap,
        ),
        notificationType: deserializeParam(
          data['notification_type'],
          ParamType.String,
          false,
        ),
        notificationBody: deserializeParam(
          data['notification_body'],
          ParamType.String,
          false,
        ),
        notificationToPlayer: deserializeParam(
          data['notification_to_player'],
          ParamType.String,
          false,
        ),
        notificationCategory: deserializeParam(
          data['notification_category'],
          ParamType.String,
          false,
        ),
        notificationCreatedAt: deserializeParam(
          data['notification_created_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NotificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationStruct &&
        notificationId == other.notificationId &&
        notificationFromTeam == other.notificationFromTeam &&
        notificationFromPlayer == other.notificationFromPlayer &&
        notificationFromTournament == other.notificationFromTournament &&
        notificationType == other.notificationType &&
        notificationBody == other.notificationBody &&
        notificationToPlayer == other.notificationToPlayer &&
        notificationCategory == other.notificationCategory &&
        notificationCreatedAt == other.notificationCreatedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        notificationId,
        notificationFromTeam,
        notificationFromPlayer,
        notificationFromTournament,
        notificationType,
        notificationBody,
        notificationToPlayer,
        notificationCategory,
        notificationCreatedAt
      ]);
}

NotificationStruct createNotificationStruct({
  int? notificationId,
  TeamStruct? notificationFromTeam,
  PlayerStruct? notificationFromPlayer,
  TournamentStruct? notificationFromTournament,
  String? notificationType,
  String? notificationBody,
  String? notificationToPlayer,
  String? notificationCategory,
  String? notificationCreatedAt,
}) =>
    NotificationStruct(
      notificationId: notificationId,
      notificationFromTeam: notificationFromTeam ?? TeamStruct(),
      notificationFromPlayer: notificationFromPlayer ?? PlayerStruct(),
      notificationFromTournament:
          notificationFromTournament ?? TournamentStruct(),
      notificationType: notificationType,
      notificationBody: notificationBody,
      notificationToPlayer: notificationToPlayer,
      notificationCategory: notificationCategory,
      notificationCreatedAt: notificationCreatedAt,
    );
