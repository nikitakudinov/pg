import '../database.dart';

class TournamentsTable extends SupabaseTable<TournamentsRow> {
  @override
  String get tableName => 'tournaments';

  @override
  TournamentsRow createRow(Map<String, dynamic> data) => TournamentsRow(data);
}

class TournamentsRow extends SupabaseDataRow {
  TournamentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TournamentsTable();

  int get tournamentId => getField<int>('tournament_id')!;
  set tournamentId(int value) => setField<int>('tournament_id', value);

  DateTime get tournamentCreatedAt =>
      getField<DateTime>('tournament_created_at')!;
  set tournamentCreatedAt(DateTime value) =>
      setField<DateTime>('tournament_created_at', value);

  String? get tournamentName => getField<String>('tournament_name');
  set tournamentName(String? value) =>
      setField<String>('tournament_name', value);

  String? get tournamentTag => getField<String>('tournament_tag');
  set tournamentTag(String? value) => setField<String>('tournament_tag', value);

  String? get tournamentLogo => getField<String>('tournament_logo');
  set tournamentLogo(String? value) =>
      setField<String>('tournament_logo', value);

  String? get tournamentFlag => getField<String>('tournament_flag');
  set tournamentFlag(String? value) =>
      setField<String>('tournament_flag', value);

  String? get tournamentCountry => getField<String>('tournament_country');
  set tournamentCountry(String? value) =>
      setField<String>('tournament_country', value);

  String? get tournamentStatus => getField<String>('tournament_status');
  set tournamentStatus(String? value) =>
      setField<String>('tournament_status', value);

  String? get tournamentCreator => getField<String>('tournament_creator');
  set tournamentCreator(String? value) =>
      setField<String>('tournament_creator', value);

  int? get tournamentTeamsCount => getField<int>('tournament_teams_count');
  set tournamentTeamsCount(int? value) =>
      setField<int>('tournament_teams_count', value);

  String? get tournamentHeaderImage =>
      getField<String>('tournament_header_image');
  set tournamentHeaderImage(String? value) =>
      setField<String>('tournament_header_image', value);

  String? get tournamentStartDate => getField<String>('tournament_start_date');
  set tournamentStartDate(String? value) =>
      setField<String>('tournament_start_date', value);

  String? get tournamentEndDate => getField<String>('tournament_end_date');
  set tournamentEndDate(String? value) =>
      setField<String>('tournament_end_date', value);

  String? get tournamentGametype => getField<String>('tournament_gametype');
  set tournamentGametype(String? value) =>
      setField<String>('tournament_gametype', value);

  int? get tournamentRoundsInMatch =>
      getField<int>('tournament_rounds_in_match');
  set tournamentRoundsInMatch(int? value) =>
      setField<int>('tournament_rounds_in_match', value);

  List<int> get tournamentMembersId =>
      getListField<int>('tournament_members-id');
  set tournamentMembersId(List<int>? value) =>
      setListField<int>('tournament_members-id', value);
}
