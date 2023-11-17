import '../database.dart';

class AlertsTable extends SupabaseTable<AlertsRow> {
  @override
  String get tableName => 'alerts';

  @override
  AlertsRow createRow(Map<String, dynamic> data) => AlertsRow(data);
}

class AlertsRow extends SupabaseDataRow {
  AlertsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AlertsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get fromTeam => getField<int>('from_team');
  set fromTeam(int? value) => setField<int>('from_team', value);

  String? get fromUser => getField<String>('from_user');
  set fromUser(String? value) => setField<String>('from_user', value);

  int? get fromTournament => getField<int>('from_tournament');
  set fromTournament(int? value) => setField<int>('from_tournament', value);

  String? get toUser => getField<String>('to_user');
  set toUser(String? value) => setField<String>('to_user', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
