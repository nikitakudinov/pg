import '../database.dart';

class TestTable extends SupabaseTable<TestRow> {
  @override
  String get tableName => 'test';

  @override
  TestRow createRow(Map<String, dynamic> data) => TestRow(data);
}

class TestRow extends SupabaseDataRow {
  TestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TestTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);
}
