import '../database.dart';

class TournamentOrganizatorsTable
    extends SupabaseTable<TournamentOrganizatorsRow> {
  @override
  String get tableName => 'tournament_organizators';

  @override
  TournamentOrganizatorsRow createRow(Map<String, dynamic> data) =>
      TournamentOrganizatorsRow(data);
}

class TournamentOrganizatorsRow extends SupabaseDataRow {
  TournamentOrganizatorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TournamentOrganizatorsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get tournamentId => getField<int>('tournament_id')!;
  set tournamentId(int value) => setField<int>('tournament_id', value);

  String get playerUid => getField<String>('player_uid')!;
  set playerUid(String value) => setField<String>('player_uid', value);
}
