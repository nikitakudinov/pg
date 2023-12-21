import '../database.dart';

class MatchesTable extends SupabaseTable<MatchesRow> {
  @override
  String get tableName => 'matches';

  @override
  MatchesRow createRow(Map<String, dynamic> data) => MatchesRow(data);
}

class MatchesRow extends SupabaseDataRow {
  MatchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MatchesTable();

  int get matchId => getField<int>('match_id')!;
  set matchId(int value) => setField<int>('match_id', value);

  String? get matchPlannedDate => getField<String>('match_planned_date');
  set matchPlannedDate(String? value) =>
      setField<String>('match_planned_date', value);

  String get matchDate => getField<String>('match_date')!;
  set matchDate(String value) => setField<String>('match_date', value);

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
}
