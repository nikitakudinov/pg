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

  List<int> get tournamentMembers => getListField<int>('tournament_members');
  set tournamentMembers(List<int>? value) =>
      setListField<int>('tournament_members', value);

  List<String> get tournamentOrganizators =>
      getListField<String>('tournament_organizators');
  set tournamentOrganizators(List<String>? value) =>
      setListField<String>('tournament_organizators', value);

  String? get tournamentStatus => getField<String>('tournament_status');
  set tournamentStatus(String? value) =>
      setField<String>('tournament_status', value);
}
