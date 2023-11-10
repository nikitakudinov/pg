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

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get tournamentName => getField<String>('tournamentName');
  set tournamentName(String? value) =>
      setField<String>('tournamentName', value);

  String? get tournamentTag => getField<String>('tournamentTag');
  set tournamentTag(String? value) => setField<String>('tournamentTag', value);

  List<int> get tournamentMembers => getListField<int>('tournamentMembers');
  set tournamentMembers(List<int>? value) =>
      setListField<int>('tournamentMembers', value);

  List<int> get tournamentOrganizators =>
      getListField<int>('tournamentOrganizators');
  set tournamentOrganizators(List<int>? value) =>
      setListField<int>('tournamentOrganizators', value);

  String? get tournamentStatus => getField<String>('tournamentStatus');
  set tournamentStatus(String? value) =>
      setField<String>('tournamentStatus', value);

  DateTime? get tournamentRegistrationStartDate =>
      getField<DateTime>('tournamentRegistrationStartDate');
  set tournamentRegistrationStartDate(DateTime? value) =>
      setField<DateTime>('tournamentRegistrationStartDate', value);

  DateTime? get tournamentRegistrationEndDate =>
      getField<DateTime>('tournamentRegistrationEndDate');
  set tournamentRegistrationEndDate(DateTime? value) =>
      setField<DateTime>('tournamentRegistrationEndDate', value);

  DateTime? get tournamentStartDate =>
      getField<DateTime>('tournamentStartDate');
  set tournamentStartDate(DateTime? value) =>
      setField<DateTime>('tournamentStartDate', value);

  DateTime? get tournamentEndDate => getField<DateTime>('tournamentEndDate');
  set tournamentEndDate(DateTime? value) =>
      setField<DateTime>('tournamentEndDate', value);

  String? get tournamentLogo => getField<String>('tournamentLogo');
  set tournamentLogo(String? value) =>
      setField<String>('tournamentLogo', value);
}
