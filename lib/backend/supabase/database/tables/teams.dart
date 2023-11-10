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

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get teamName => getField<String>('teamName');
  set teamName(String? value) => setField<String>('teamName', value);

  String? get teamTag => getField<String>('teamTag');
  set teamTag(String? value) => setField<String>('teamTag', value);

  String? get teamLogo => getField<String>('teamLogo');
  set teamLogo(String? value) => setField<String>('teamLogo', value);

  int? get teamOwner => getField<int>('teamOwner');
  set teamOwner(int? value) => setField<int>('teamOwner', value);

  List<int> get teamMembers => getListField<int>('teamMembers');
  set teamMembers(List<int>? value) => setListField<int>('teamMembers', value);
}
