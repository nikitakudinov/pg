// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountersStruct extends BaseStruct {
  CountersStruct({
    int? notifications,
    int? messages,
    int? teams,
  })  : _notifications = notifications,
        _messages = messages,
        _teams = teams;

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

  static CountersStruct fromMap(Map<String, dynamic> data) => CountersStruct(
        notifications: castToType<int>(data['NOTIFICATIONS']),
        messages: castToType<int>(data['MESSAGES']),
        teams: castToType<int>(data['TEAMS']),
      );

  static CountersStruct? maybeFromMap(dynamic data) =>
      data is Map ? CountersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'NOTIFICATIONS': _notifications,
        'MESSAGES': _messages,
        'TEAMS': _teams,
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
      );

  @override
  String toString() => 'CountersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountersStruct &&
        notifications == other.notifications &&
        messages == other.messages &&
        teams == other.teams;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([notifications, messages, teams]);
}

CountersStruct createCountersStruct({
  int? notifications,
  int? messages,
  int? teams,
}) =>
    CountersStruct(
      notifications: notifications,
      messages: messages,
      teams: teams,
    );
