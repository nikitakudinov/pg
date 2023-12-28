import '../database.dart';

class TeamsandmatchesTable extends SupabaseTable<TeamsandmatchesRow> {
  @override
  String get tableName => 'teamsandmatches';

  @override
  TeamsandmatchesRow createRow(Map<String, dynamic> data) =>
      TeamsandmatchesRow(data);
}

class TeamsandmatchesRow extends SupabaseDataRow {
  TeamsandmatchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TeamsandmatchesTable();

  DateTime? get teamCreatedAt => getField<DateTime>('team_created_at');
  set teamCreatedAt(DateTime? value) =>
      setField<DateTime>('team_created_at', value);

  DateTime? get teamUpdatedAt => getField<DateTime>('team_updated_at');
  set teamUpdatedAt(DateTime? value) =>
      setField<DateTime>('team_updated_at', value);

  String? get teamName => getField<String>('team_name');
  set teamName(String? value) => setField<String>('team_name', value);

  String? get teamTag => getField<String>('team_tag');
  set teamTag(String? value) => setField<String>('team_tag', value);

  String? get teamFlag => getField<String>('team_flag');
  set teamFlag(String? value) => setField<String>('team_flag', value);

  String? get teamCountry => getField<String>('team_country');
  set teamCountry(String? value) => setField<String>('team_country', value);

  String? get teamCreator => getField<String>('team_creator');
  set teamCreator(String? value) => setField<String>('team_creator', value);

  String? get teamLogo => getField<String>('team_logo');
  set teamLogo(String? value) => setField<String>('team_logo', value);

  bool? get teamRecruitment => getField<bool>('team_recruitment');
  set teamRecruitment(bool? value) => setField<bool>('team_recruitment', value);

  String? get teamStatus => getField<String>('team_status');
  set teamStatus(String? value) => setField<String>('team_status', value);

  int? get teamId => getField<int>('team_id');
  set teamId(int? value) => setField<int>('team_id', value);

  int? get teamChatId => getField<int>('team_chat_id');
  set teamChatId(int? value) => setField<int>('team_chat_id', value);

  int? get teamMatchesCount => getField<int>('team_matches_count');
  set teamMatchesCount(int? value) =>
      setField<int>('team_matches_count', value);

  int? get teamMatchWins => getField<int>('team_match_wins');
  set teamMatchWins(int? value) => setField<int>('team_match_wins', value);

  int? get teamMatchLoses => getField<int>('team_match_loses');
  set teamMatchLoses(int? value) => setField<int>('team_match_loses', value);

  int? get teamMatchesRoundsCount => getField<int>('team_matches_rounds_count');
  set teamMatchesRoundsCount(int? value) =>
      setField<int>('team_matches_rounds_count', value);

  int? get teamMatchRoundWins => getField<int>('team_match_round_wins');
  set teamMatchRoundWins(int? value) =>
      setField<int>('team_match_round_wins', value);

  int? get teamMatchRoundLoses => getField<int>('team_match_round_loses');
  set teamMatchRoundLoses(int? value) =>
      setField<int>('team_match_round_loses', value);

  double? get teamWLmatches => getField<double>('team_WLmatches');
  set teamWLmatches(double? value) => setField<double>('team_WLmatches', value);

  int? get matchId => getField<int>('match_id');
  set matchId(int? value) => setField<int>('match_id', value);

  String? get matchPlannedDate => getField<String>('match_planned_date');
  set matchPlannedDate(String? value) =>
      setField<String>('match_planned_date', value);

  String? get matchDate => getField<String>('match_date');
  set matchDate(String? value) => setField<String>('match_date', value);

  int? get matchTournamentRound => getField<int>('match_tournament_round');
  set matchTournamentRound(int? value) =>
      setField<int>('match_tournament_round', value);

  int? get matchTournamentPair => getField<int>('match_tournament_pair');
  set matchTournamentPair(int? value) =>
      setField<int>('match_tournament_pair', value);

  int? get matchRival1 => getField<int>('match_rival1');
  set matchRival1(int? value) => setField<int>('match_rival1', value);

  int? get matchRival2 => getField<int>('match_rival2');
  set matchRival2(int? value) => setField<int>('match_rival2', value);

  int? get matchForTournament => getField<int>('match_for_tournament');
  set matchForTournament(int? value) =>
      setField<int>('match_for_tournament', value);

  String? get matchStatus => getField<String>('match_status');
  set matchStatus(String? value) => setField<String>('match_status', value);

  String? get matchRefery => getField<String>('match_refery');
  set matchRefery(String? value) => setField<String>('match_refery', value);

  int? get matchRival1Wins => getField<int>('match_rival1_wins');
  set matchRival1Wins(int? value) => setField<int>('match_rival1_wins', value);

  int? get matchRival2Wins => getField<int>('match_rival2_wins');
  set matchRival2Wins(int? value) => setField<int>('match_rival2_wins', value);

  String? get matchScreenshot1 => getField<String>('match_screenshot1');
  set matchScreenshot1(String? value) =>
      setField<String>('match_screenshot1', value);

  String? get matchScreenshot2 => getField<String>('match_screenshot2');
  set matchScreenshot2(String? value) =>
      setField<String>('match_screenshot2', value);

  String? get matchScreenshot3 => getField<String>('match_screenshot3');
  set matchScreenshot3(String? value) =>
      setField<String>('match_screenshot3', value);

  String? get matchScreenshot4 => getField<String>('match_screenshot4');
  set matchScreenshot4(String? value) =>
      setField<String>('match_screenshot4', value);

  String? get matchScreenshot5 => getField<String>('match_screenshot5');
  set matchScreenshot5(String? value) =>
      setField<String>('match_screenshot5', value);

  String? get matchReportedBy => getField<String>('match_reported_by');
  set matchReportedBy(String? value) =>
      setField<String>('match_reported_by', value);

  int? get matchWinner => getField<int>('match_winner');
  set matchWinner(int? value) => setField<int>('match_winner', value);

  int? get matchLooser => getField<int>('match_looser');
  set matchLooser(int? value) => setField<int>('match_looser', value);

  DateTime? get matchUpdatetedAt => getField<DateTime>('match_updateted_at');
  set matchUpdatetedAt(DateTime? value) =>
      setField<DateTime>('match_updateted_at', value);
}
