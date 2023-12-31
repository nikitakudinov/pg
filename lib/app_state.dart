import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  UserStruct _authenticateduser = UserStruct();
  UserStruct get authenticateduser => _authenticateduser;
  set authenticateduser(UserStruct _value) {
    _authenticateduser = _value;
  }

  void updateAuthenticateduserStruct(Function(UserStruct) updateFn) {
    updateFn(_authenticateduser);
  }

  List<TeamStruct> _allTEAMS = [];
  List<TeamStruct> get allTEAMS => _allTEAMS;
  set allTEAMS(List<TeamStruct> _value) {
    _allTEAMS = _value;
  }

  void addToAllTEAMS(TeamStruct _value) {
    _allTEAMS.add(_value);
  }

  void removeFromAllTEAMS(TeamStruct _value) {
    _allTEAMS.remove(_value);
  }

  void removeAtIndexFromAllTEAMS(int _index) {
    _allTEAMS.removeAt(_index);
  }

  void updateAllTEAMSAtIndex(
    int _index,
    TeamStruct Function(TeamStruct) updateFn,
  ) {
    _allTEAMS[_index] = updateFn(_allTEAMS[_index]);
  }

  void insertAtIndexInAllTEAMS(int _index, TeamStruct _value) {
    _allTEAMS.insert(_index, _value);
  }

  List<CountrieStruct> _allCountries = [];
  List<CountrieStruct> get allCountries => _allCountries;
  set allCountries(List<CountrieStruct> _value) {
    _allCountries = _value;
  }

  void addToAllCountries(CountrieStruct _value) {
    _allCountries.add(_value);
  }

  void removeFromAllCountries(CountrieStruct _value) {
    _allCountries.remove(_value);
  }

  void removeAtIndexFromAllCountries(int _index) {
    _allCountries.removeAt(_index);
  }

  void updateAllCountriesAtIndex(
    int _index,
    CountrieStruct Function(CountrieStruct) updateFn,
  ) {
    _allCountries[_index] = updateFn(_allCountries[_index]);
  }

  void insertAtIndexInAllCountries(int _index, CountrieStruct _value) {
    _allCountries.insert(_index, _value);
  }

  List<ChatStruct> _AllAuthUsersChats = [];
  List<ChatStruct> get AllAuthUsersChats => _AllAuthUsersChats;
  set AllAuthUsersChats(List<ChatStruct> _value) {
    _AllAuthUsersChats = _value;
  }

  void addToAllAuthUsersChats(ChatStruct _value) {
    _AllAuthUsersChats.add(_value);
  }

  void removeFromAllAuthUsersChats(ChatStruct _value) {
    _AllAuthUsersChats.remove(_value);
  }

  void removeAtIndexFromAllAuthUsersChats(int _index) {
    _AllAuthUsersChats.removeAt(_index);
  }

  void updateAllAuthUsersChatsAtIndex(
    int _index,
    ChatStruct Function(ChatStruct) updateFn,
  ) {
    _AllAuthUsersChats[_index] = updateFn(_AllAuthUsersChats[_index]);
  }

  void insertAtIndexInAllAuthUsersChats(int _index, ChatStruct _value) {
    _AllAuthUsersChats.insert(_index, _value);
  }

  PlayerStruct _authPlayer = PlayerStruct();
  PlayerStruct get authPlayer => _authPlayer;
  set authPlayer(PlayerStruct _value) {
    _authPlayer = _value;
  }

  void updateAuthPlayerStruct(Function(PlayerStruct) updateFn) {
    updateFn(_authPlayer);
  }

  TeamStruct _authPlayerTeam = TeamStruct();
  TeamStruct get authPlayerTeam => _authPlayerTeam;
  set authPlayerTeam(TeamStruct _value) {
    _authPlayerTeam = _value;
  }

  void updateAuthPlayerTeamStruct(Function(TeamStruct) updateFn) {
    updateFn(_authPlayerTeam);
  }

  List<MessageStruct> _alerts = [];
  List<MessageStruct> get alerts => _alerts;
  set alerts(List<MessageStruct> _value) {
    _alerts = _value;
  }

  void addToAlerts(MessageStruct _value) {
    _alerts.add(_value);
  }

  void removeFromAlerts(MessageStruct _value) {
    _alerts.remove(_value);
  }

  void removeAtIndexFromAlerts(int _index) {
    _alerts.removeAt(_index);
  }

  void updateAlertsAtIndex(
    int _index,
    MessageStruct Function(MessageStruct) updateFn,
  ) {
    _alerts[_index] = updateFn(_alerts[_index]);
  }

  void insertAtIndexInAlerts(int _index, MessageStruct _value) {
    _alerts.insert(_index, _value);
  }

  int _alertsCount = 0;
  int get alertsCount => _alertsCount;
  set alertsCount(int _value) {
    _alertsCount = _value;
  }

  List<NotificationStruct> _notofications = [];
  List<NotificationStruct> get notofications => _notofications;
  set notofications(List<NotificationStruct> _value) {
    _notofications = _value;
  }

  void addToNotofications(NotificationStruct _value) {
    _notofications.add(_value);
  }

  void removeFromNotofications(NotificationStruct _value) {
    _notofications.remove(_value);
  }

  void removeAtIndexFromNotofications(int _index) {
    _notofications.removeAt(_index);
  }

  void updateNotoficationsAtIndex(
    int _index,
    NotificationStruct Function(NotificationStruct) updateFn,
  ) {
    _notofications[_index] = updateFn(_notofications[_index]);
  }

  void insertAtIndexInNotofications(int _index, NotificationStruct _value) {
    _notofications.insert(_index, _value);
  }

  int _selectedTeamId = 0;
  int get selectedTeamId => _selectedTeamId;
  set selectedTeamId(int _value) {
    _selectedTeamId = _value;
  }

  List<PlayerStruct> _curentTeamMembersList = [];
  List<PlayerStruct> get curentTeamMembersList => _curentTeamMembersList;
  set curentTeamMembersList(List<PlayerStruct> _value) {
    _curentTeamMembersList = _value;
  }

  void addToCurentTeamMembersList(PlayerStruct _value) {
    _curentTeamMembersList.add(_value);
  }

  void removeFromCurentTeamMembersList(PlayerStruct _value) {
    _curentTeamMembersList.remove(_value);
  }

  void removeAtIndexFromCurentTeamMembersList(int _index) {
    _curentTeamMembersList.removeAt(_index);
  }

  void updateCurentTeamMembersListAtIndex(
    int _index,
    PlayerStruct Function(PlayerStruct) updateFn,
  ) {
    _curentTeamMembersList[_index] = updateFn(_curentTeamMembersList[_index]);
  }

  void insertAtIndexInCurentTeamMembersList(int _index, PlayerStruct _value) {
    _curentTeamMembersList.insert(_index, _value);
  }

  int _allTEAMScount = 0;
  int get allTEAMScount => _allTEAMScount;
  set allTEAMScount(int _value) {
    _allTEAMScount = _value;
  }

  List<TeamStruct> _authPlayerTeamList = [];
  List<TeamStruct> get authPlayerTeamList => _authPlayerTeamList;
  set authPlayerTeamList(List<TeamStruct> _value) {
    _authPlayerTeamList = _value;
  }

  void addToAuthPlayerTeamList(TeamStruct _value) {
    _authPlayerTeamList.add(_value);
  }

  void removeFromAuthPlayerTeamList(TeamStruct _value) {
    _authPlayerTeamList.remove(_value);
  }

  void removeAtIndexFromAuthPlayerTeamList(int _index) {
    _authPlayerTeamList.removeAt(_index);
  }

  void updateAuthPlayerTeamListAtIndex(
    int _index,
    TeamStruct Function(TeamStruct) updateFn,
  ) {
    _authPlayerTeamList[_index] = updateFn(_authPlayerTeamList[_index]);
  }

  void insertAtIndexInAuthPlayerTeamList(int _index, TeamStruct _value) {
    _authPlayerTeamList.insert(_index, _value);
  }

  String _authUserUpdated = '';
  String get authUserUpdated => _authUserUpdated;
  set authUserUpdated(String _value) {
    _authUserUpdated = _value;
  }

  int _chatsCount = 0;
  int get chatsCount => _chatsCount;
  set chatsCount(int _value) {
    _chatsCount = _value;
  }

  List<MessageStruct> _messages = [];
  List<MessageStruct> get messages => _messages;
  set messages(List<MessageStruct> _value) {
    _messages = _value;
  }

  void addToMessages(MessageStruct _value) {
    _messages.add(_value);
  }

  void removeFromMessages(MessageStruct _value) {
    _messages.remove(_value);
  }

  void removeAtIndexFromMessages(int _index) {
    _messages.removeAt(_index);
  }

  void updateMessagesAtIndex(
    int _index,
    MessageStruct Function(MessageStruct) updateFn,
  ) {
    _messages[_index] = updateFn(_messages[_index]);
  }

  void insertAtIndexInMessages(int _index, MessageStruct _value) {
    _messages.insert(_index, _value);
  }

  List<PlayerStruct> _players = [];
  List<PlayerStruct> get players => _players;
  set players(List<PlayerStruct> _value) {
    _players = _value;
  }

  void addToPlayers(PlayerStruct _value) {
    _players.add(_value);
  }

  void removeFromPlayers(PlayerStruct _value) {
    _players.remove(_value);
  }

  void removeAtIndexFromPlayers(int _index) {
    _players.removeAt(_index);
  }

  void updatePlayersAtIndex(
    int _index,
    PlayerStruct Function(PlayerStruct) updateFn,
  ) {
    _players[_index] = updateFn(_players[_index]);
  }

  void insertAtIndexInPlayers(int _index, PlayerStruct _value) {
    _players.insert(_index, _value);
  }

  int _ureadedMessagesCount = 0;
  int get ureadedMessagesCount => _ureadedMessagesCount;
  set ureadedMessagesCount(int _value) {
    _ureadedMessagesCount = _value;
  }

  List<ChatStruct> _chats = [];
  List<ChatStruct> get chats => _chats;
  set chats(List<ChatStruct> _value) {
    _chats = _value;
  }

  void addToChats(ChatStruct _value) {
    _chats.add(_value);
  }

  void removeFromChats(ChatStruct _value) {
    _chats.remove(_value);
  }

  void removeAtIndexFromChats(int _index) {
    _chats.removeAt(_index);
  }

  void updateChatsAtIndex(
    int _index,
    ChatStruct Function(ChatStruct) updateFn,
  ) {
    _chats[_index] = updateFn(_chats[_index]);
  }

  void insertAtIndexInChats(int _index, ChatStruct _value) {
    _chats.insert(_index, _value);
  }

  MessageReadedStruct _authPalayerMessageReaded =
      MessageReadedStruct.fromSerializableMap(jsonDecode(
          '{\"player_uid\":\"29ab458c-7308-44c3-9e1c-868ad41820cd\"}'));
  MessageReadedStruct get authPalayerMessageReaded => _authPalayerMessageReaded;
  set authPalayerMessageReaded(MessageReadedStruct _value) {
    _authPalayerMessageReaded = _value;
  }

  void updateAuthPalayerMessageReadedStruct(
      Function(MessageReadedStruct) updateFn) {
    updateFn(_authPalayerMessageReaded);
  }

  int _unreadedMessagesLoop = 0;
  int get unreadedMessagesLoop => _unreadedMessagesLoop;
  set unreadedMessagesLoop(int _value) {
    _unreadedMessagesLoop = _value;
  }

  List<TournamentStruct> _tournaments = [];
  List<TournamentStruct> get tournaments => _tournaments;
  set tournaments(List<TournamentStruct> _value) {
    _tournaments = _value;
  }

  void addToTournaments(TournamentStruct _value) {
    _tournaments.add(_value);
  }

  void removeFromTournaments(TournamentStruct _value) {
    _tournaments.remove(_value);
  }

  void removeAtIndexFromTournaments(int _index) {
    _tournaments.removeAt(_index);
  }

  void updateTournamentsAtIndex(
    int _index,
    TournamentStruct Function(TournamentStruct) updateFn,
  ) {
    _tournaments[_index] = updateFn(_tournaments[_index]);
  }

  void insertAtIndexInTournaments(int _index, TournamentStruct _value) {
    _tournaments.insert(_index, _value);
  }

  List<MatchStruct> _matches = [];
  List<MatchStruct> get matches => _matches;
  set matches(List<MatchStruct> _value) {
    _matches = _value;
  }

  void addToMatches(MatchStruct _value) {
    _matches.add(_value);
  }

  void removeFromMatches(MatchStruct _value) {
    _matches.remove(_value);
  }

  void removeAtIndexFromMatches(int _index) {
    _matches.removeAt(_index);
  }

  void updateMatchesAtIndex(
    int _index,
    MatchStruct Function(MatchStruct) updateFn,
  ) {
    _matches[_index] = updateFn(_matches[_index]);
  }

  void insertAtIndexInMatches(int _index, MatchStruct _value) {
    _matches.insert(_index, _value);
  }

  List<MatchStruct> _tournamentMatches = [];
  List<MatchStruct> get tournamentMatches => _tournamentMatches;
  set tournamentMatches(List<MatchStruct> _value) {
    _tournamentMatches = _value;
  }

  void addToTournamentMatches(MatchStruct _value) {
    _tournamentMatches.add(_value);
  }

  void removeFromTournamentMatches(MatchStruct _value) {
    _tournamentMatches.remove(_value);
  }

  void removeAtIndexFromTournamentMatches(int _index) {
    _tournamentMatches.removeAt(_index);
  }

  void updateTournamentMatchesAtIndex(
    int _index,
    MatchStruct Function(MatchStruct) updateFn,
  ) {
    _tournamentMatches[_index] = updateFn(_tournamentMatches[_index]);
  }

  void insertAtIndexInTournamentMatches(int _index, MatchStruct _value) {
    _tournamentMatches.insert(_index, _value);
  }

  List<MatchStruct> _curentMatchData = [];
  List<MatchStruct> get curentMatchData => _curentMatchData;
  set curentMatchData(List<MatchStruct> _value) {
    _curentMatchData = _value;
  }

  void addToCurentMatchData(MatchStruct _value) {
    _curentMatchData.add(_value);
  }

  void removeFromCurentMatchData(MatchStruct _value) {
    _curentMatchData.remove(_value);
  }

  void removeAtIndexFromCurentMatchData(int _index) {
    _curentMatchData.removeAt(_index);
  }

  void updateCurentMatchDataAtIndex(
    int _index,
    MatchStruct Function(MatchStruct) updateFn,
  ) {
    _curentMatchData[_index] = updateFn(_curentMatchData[_index]);
  }

  void insertAtIndexInCurentMatchData(int _index, MatchStruct _value) {
    _curentMatchData.insert(_index, _value);
  }

  MaindataStruct _MAINDATA = MaindataStruct();
  MaindataStruct get MAINDATA => _MAINDATA;
  set MAINDATA(MaindataStruct _value) {
    _MAINDATA = _value;
  }

  void updateMAINDATAStruct(Function(MaindataStruct) updateFn) {
    updateFn(_MAINDATA);
  }

  CountersStruct _COUNTERS = CountersStruct();
  CountersStruct get COUNTERS => _COUNTERS;
  set COUNTERS(CountersStruct _value) {
    _COUNTERS = _value;
  }

  void updateCOUNTERSStruct(Function(CountersStruct) updateFn) {
    updateFn(_COUNTERS);
  }

  VisibilityStruct _VISIBILITY = VisibilityStruct();
  VisibilityStruct get VISIBILITY => _VISIBILITY;
  set VISIBILITY(VisibilityStruct _value) {
    _VISIBILITY = _value;
  }

  void updateVISIBILITYStruct(Function(VisibilityStruct) updateFn) {
    updateFn(_VISIBILITY);
  }

  PlayerStruct _AUTHPLAYER = PlayerStruct();
  PlayerStruct get AUTHPLAYER => _AUTHPLAYER;
  set AUTHPLAYER(PlayerStruct _value) {
    _AUTHPLAYER = _value;
  }

  void updateAUTHPLAYERStruct(Function(PlayerStruct) updateFn) {
    updateFn(_AUTHPLAYER);
  }

  TeamStruct _AUTHPLAYERTEAM = TeamStruct();
  TeamStruct get AUTHPLAYERTEAM => _AUTHPLAYERTEAM;
  set AUTHPLAYERTEAM(TeamStruct _value) {
    _AUTHPLAYERTEAM = _value;
  }

  void updateAUTHPLAYERTEAMStruct(Function(TeamStruct) updateFn) {
    updateFn(_AUTHPLAYERTEAM);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
