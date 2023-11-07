import '../database.dart';

class TeamMembersTable extends SupabaseTable<TeamMembersRow> {
  @override
  String get tableName => 'team_members';

  @override
  TeamMembersRow createRow(Map<String, dynamic> data) => TeamMembersRow(data);
}

class TeamMembersRow extends SupabaseDataRow {
  TeamMembersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TeamMembersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get teamId => getField<int>('team_id')!;
  set teamId(int value) => setField<int>('team_id', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);
}
