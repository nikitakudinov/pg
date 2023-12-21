import '../database.dart';

class TeamsTable extends SupabaseTable<TeamsRow> {
  @override
  String get tableName => 'teams';

  @override
  TeamsRow createRow(Map<String, dynamic> data) => TeamsRow(data);
}

class TeamsRow extends SupabaseDataRow {
  TeamsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TeamsTable();

  DateTime get teamCreatedAt => getField<DateTime>('team_created_at')!;
  set teamCreatedAt(DateTime value) =>
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

  int get teamId => getField<int>('team_id')!;
  set teamId(int value) => setField<int>('team_id', value);

  int get teamChatId => getField<int>('team_chat_id')!;
  set teamChatId(int value) => setField<int>('team_chat_id', value);

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
}
