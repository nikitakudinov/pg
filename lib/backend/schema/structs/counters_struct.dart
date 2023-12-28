// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountersStruct extends BaseStruct {
  CountersStruct({
    int? notifications,
    int? messages,
    int? teams,
    int? updatedteams,
    String? teamslastupdatetime,
  })  : _notifications = notifications,
        _messages = messages,
        _teams = teams,
        _updatedteams = updatedteams,
        _teamslastupdatetime = teamslastupdatetime;

  // "NOTIFICATIONS" field.
  int? _notifications;
  int get notifications => _notifications ?? 0;
  set notifications(int? val) => _notifications = val;
  void incrementNotifications(int amount) =>
      _notifications = notifications + amount;
  bool hasNotifications() => _notifications != null;

  // "MESSAGES" field.
  int? _messages;
  int get messages => _messages ?? 0;
  set messages(int? val) => _messages = val;
  void incrementMessages(int amount) => _messages = messages + amount;
  bool hasMessages() => _messages != null;

  // "TEAMS" field.
  int? _teams;
  int get teams => _teams ?? 0;
  set teams(int? val) => _teams = val;
  void incrementTeams(int amount) => _teams = teams + amount;
  bool hasTeams() => _teams != null;

  // "UPDATEDTEAMS" field.
  int? _updatedteams;
  int get updatedteams => _updatedteams ?? 0;
  set updatedteams(int? val) => _updatedteams = val;
  void incrementUpdatedteams(int amount) =>
      _updatedteams = updatedteams + amount;
  bool hasUpdatedteams() => _updatedteams != null;

  // "TEAMSLASTUPDATETIME" field.
  String? _teamslastupdatetime;
  String get teamslastupdatetime => _teamslastupdatetime ?? '';
  set teamslastupdatetime(String? val) => _teamslastupdatetime = val;
  bool hasTeamslastupdatetime() => _teamslastupdatetime != null;

  static CountersStruct fromMap(Map<String, dynamic> data) => CountersStruct(
        notifications: castToType<int>(data['NOTIFICATIONS']),
        messages: castToType<int>(data['MESSAGES']),
        teams: castToType<int>(data['TEAMS']),
        updatedteams: castToType<int>(data['UPDATEDTEAMS']),
        teamslastupdatetime: data['TEAMSLASTUPDATETIME'] as String?,
      );

  static CountersStruct? maybeFromMap(dynamic data) =>
      data is Map ? CountersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'NOTIFICATIONS': _notifications,
        'MESSAGES': _messages,
        'TEAMS': _teams,
        'UPDATEDTEAMS': _updatedteams,
        'TEAMSLASTUPDATETIME': _teamslastupdatetime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NOTIFICATIONS': serializeParam(
          _notifications,
          ParamType.int,
        ),
        'MESSAGES': serializeParam(
          _messages,
          ParamType.int,
        ),
        'TEAMS': serializeParam(
          _teams,
          ParamType.int,
        ),
        'UPDATEDTEAMS': serializeParam(
          _updatedteams,
          ParamType.int,
        ),
        'TEAMSLASTUPDATETIME': serializeParam(
          _teamslastupdatetime,
          ParamType.String,
        ),
      }.withoutNulls;

  static CountersStruct fromSerializableMap(Map<String, dynamic> data) =>
      CountersStruct(
        notifications: deserializeParam(
          data['NOTIFICATIONS'],
          ParamType.int,
          false,
        ),
        messages: deserializeParam(
          data['MESSAGES'],
          ParamType.int,
          false,
        ),
        teams: deserializeParam(
          data['TEAMS'],
          ParamType.int,
          false,
        ),
        updatedteams: deserializeParam(
          data['UPDATEDTEAMS'],
          ParamType.int,
          false,
        ),
        teamslastupdatetime: deserializeParam(
          data['TEAMSLASTUPDATETIME'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CountersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountersStruct &&
        notifications == other.notifications &&
        messages == other.messages &&
        teams == other.teams &&
        updatedteams == other.updatedteams &&
        teamslastupdatetime == other.teamslastupdatetime;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [notifications, messages, teams, updatedteams, teamslastupdatetime]);
}

CountersStruct createCountersStruct({
  int? notifications,
  int? messages,
  int? teams,
  int? updatedteams,
  String? teamslastupdatetime,
}) =>
    CountersStruct(
      notifications: notifications,
      messages: messages,
      teams: teams,
      updatedteams: updatedteams,
      teamslastupdatetime: teamslastupdatetime,
    );
