import '../database.dart';

class TournamentMembersTable extends SupabaseTable<TournamentMembersRow> {
  @override
  String get tableName => 'tournament_members';

  @override
  TournamentMembersRow createRow(Map<String, dynamic> data) =>
      TournamentMembersRow(data);
}

class TournamentMembersRow extends SupabaseDataRow {
  TournamentMembersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TournamentMembersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get teamId => getField<int>('team_id')!;
  set teamId(int value) => setField<int>('team_id', value);

  int get tournamentId => getField<int>('tournament_id')!;
  set tournamentId(int value) => setField<int>('tournament_id', value);
}
