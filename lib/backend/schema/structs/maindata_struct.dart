// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaindataStruct extends BaseStruct {
  MaindataStruct({
    List<PlayerStruct>? players,
    List<TeamStruct>? teams,
    PlayerStruct? authplayer,
    List<MatchStruct>? matches,
    List<NotificationStruct>? notifications,
    List<ChatStruct>? chats,
    List<TournamentStruct>? tournaments,
    List<CountrieStruct>? countries,
  })  : _players = players,
        _teams = teams,
        _authplayer = authplayer,
        _matches = matches,
        _notifications = notifications,
        _chats = chats,
        _tournaments = tournaments,
        _countries = countries;

  // "PLAYERS" field.
  List<PlayerStruct>? _players;
  List<PlayerStruct> get players => _players ?? const [];
  set players(List<PlayerStruct>? val) => _players = val;
  void updatePlayers(Function(List<PlayerStruct>) updateFn) =>
      updateFn(_players ??= []);
  bool hasPlayers() => _players != null;

  // "TEAMS" field.
  List<TeamStruct>? _teams;
  List<TeamStruct> get teams => _teams ?? const [];
  set teams(List<TeamStruct>? val) => _teams = val;
  void updateTeams(Function(List<TeamStruct>) updateFn) =>
      updateFn(_teams ??= []);
  bool hasTeams() => _teams != null;

  // "AUTHPLAYER" field.
  PlayerStruct? _authplayer;
  PlayerStruct get authplayer => _authplayer ?? PlayerStruct();
  set authplayer(PlayerStruct? val) => _authplayer = val;
  void updateAuthplayer(Function(PlayerStruct) updateFn) =>
      updateFn(_authplayer ??= PlayerStruct());
  bool hasAuthplayer() => _authplayer != null;

  // "MATCHES" field.
  List<MatchStruct>? _matches;
  List<MatchStruct> get matches => _matches ?? const [];
  set matches(List<MatchStruct>? val) => _matches = val;
  void updateMatches(Function(List<MatchStruct>) updateFn) =>
      updateFn(_matches ??= []);
  bool hasMatches() => _matches != null;

  // "NOTIFICATIONS" field.
  List<NotificationStruct>? _notifications;
  List<NotificationStruct> get notifications => _notifications ?? const [];
  set notifications(List<NotificationStruct>? val) => _notifications = val;
  void updateNotifications(Function(List<NotificationStruct>) updateFn) =>
      updateFn(_notifications ??= []);
  bool hasNotifications() => _notifications != null;

  // "CHATS" field.
  List<ChatStruct>? _chats;
  List<ChatStruct> get chats => _chats ?? const [];
  set chats(List<ChatStruct>? val) => _chats = val;
  void updateChats(Function(List<ChatStruct>) updateFn) =>
      updateFn(_chats ??= []);
  bool hasChats() => _chats != null;

  // "TOURNAMENTS" field.
  List<TournamentStruct>? _tournaments;
  List<TournamentStruct> get tournaments => _tournaments ?? const [];
  set tournaments(List<TournamentStruct>? val) => _tournaments = val;
  void updateTournaments(Function(List<TournamentStruct>) updateFn) =>
      updateFn(_tournaments ??= []);
  bool hasTournaments() => _tournaments != null;

  // "COUNTRIES" field.
  List<CountrieStruct>? _countries;
  List<CountrieStruct> get countries => _countries ?? const [];
  set countries(List<CountrieStruct>? val) => _countries = val;
  void updateCountries(Function(List<CountrieStruct>) updateFn) =>
      updateFn(_countries ??= []);
  bool hasCountries() => _countries != null;

  static MaindataStruct fromMap(Map<String, dynamic> data) => MaindataStruct(
        players: getStructList(
          data['PLAYERS'],
          PlayerStruct.fromMap,
        ),
        teams: getStructList(
          data['TEAMS'],
          TeamStruct.fromMap,
        ),
        authplayer: PlayerStruct.maybeFromMap(data['AUTHPLAYER']),
        matches: getStructList(
          data['MATCHES'],
          MatchStruct.fromMap,
        ),
        notifications: getStructList(
          data['NOTIFICATIONS'],
          NotificationStruct.fromMap,
        ),
        chats: getStructList(
          data['CHATS'],
          ChatStruct.fromMap,
        ),
        tournaments: getStructList(
          data['TOURNAMENTS'],
          TournamentStruct.fromMap,
        ),
        countries: getStructList(
          data['COUNTRIES'],
          CountrieStruct.fromMap,
        ),
      );

  static MaindataStruct? maybeFromMap(dynamic data) =>
      data is Map ? MaindataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'PLAYERS': _players?.map((e) => e.toMap()).toList(),
        'TEAMS': _teams?.map((e) => e.toMap()).toList(),
        'AUTHPLAYER': _authplayer?.toMap(),
        'MATCHES': _matches?.map((e) => e.toMap()).toList(),
        'NOTIFICATIONS': _notifications?.map((e) => e.toMap()).toList(),
        'CHATS': _chats?.map((e) => e.toMap()).toList(),
        'TOURNAMENTS': _tournaments?.map((e) => e.toMap()).toList(),
        'COUNTRIES': _countries?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'PLAYERS': serializeParam(
          _players,
          ParamType.DataStruct,
          true,
        ),
        'TEAMS': serializeParam(
          _teams,
          ParamType.DataStruct,
          true,
        ),
        'AUTHPLAYER': serializeParam(
          _authplayer,
          ParamType.DataStruct,
        ),
        'MATCHES': serializeParam(
          _matches,
          ParamType.DataStruct,
          true,
        ),
        'NOTIFICATIONS': serializeParam(
          _notifications,
          ParamType.DataStruct,
          true,
        ),
        'CHATS': serializeParam(
          _chats,
          ParamType.DataStruct,
          true,
        ),
        'TOURNAMENTS': serializeParam(
          _tournaments,
          ParamType.DataStruct,
          true,
        ),
        'COUNTRIES': serializeParam(
          _countries,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static MaindataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MaindataStruct(
        players: deserializeStructParam<PlayerStruct>(
          data['PLAYERS'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        teams: deserializeStructParam<TeamStruct>(
          data['TEAMS'],
          ParamType.DataStruct,
          true,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
        authplayer: deserializeStructParam(
          data['AUTHPLAYER'],
          ParamType.DataStruct,
          false,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        matches: deserializeStructParam<MatchStruct>(
          data['MATCHES'],
          ParamType.DataStruct,
          true,
          structBuilder: MatchStruct.fromSerializableMap,
        ),
        notifications: deserializeStructParam<NotificationStruct>(
          data['NOTIFICATIONS'],
          ParamType.DataStruct,
          true,
          structBuilder: NotificationStruct.fromSerializableMap,
        ),
        chats: deserializeStructParam<ChatStruct>(
          data['CHATS'],
          ParamType.DataStruct,
          true,
          structBuilder: ChatStruct.fromSerializableMap,
        ),
        tournaments: deserializeStructParam<TournamentStruct>(
          data['TOURNAMENTS'],
          ParamType.DataStruct,
          true,
          structBuilder: TournamentStruct.fromSerializableMap,
        ),
        countries: deserializeStructParam<CountrieStruct>(
          data['COUNTRIES'],
          ParamType.DataStruct,
          true,
          structBuilder: CountrieStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MaindataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MaindataStruct &&
        listEquality.equals(players, other.players) &&
        listEquality.equals(teams, other.teams) &&
        authplayer == other.authplayer &&
        listEquality.equals(matches, other.matches) &&
        listEquality.equals(notifications, other.notifications) &&
        listEquality.equals(chats, other.chats) &&
        listEquality.equals(tournaments, other.tournaments) &&
        listEquality.equals(countries, other.countries);
  }

  @override
  int get hashCode => const ListEquality().hash([
        players,
        teams,
        authplayer,
        matches,
        notifications,
        chats,
        tournaments,
        countries
      ]);
}

MaindataStruct createMaindataStruct({
  PlayerStruct? authplayer,
}) =>
    MaindataStruct(
      authplayer: authplayer ?? PlayerStruct(),
    );
