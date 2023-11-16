import '../database.dart';

class TestTenantTable extends SupabaseTable<TestTenantRow> {
  @override
  String get tableName => 'test_tenant';

  @override
  TestTenantRow createRow(Map<String, dynamic> data) => TestTenantRow(data);
}

class TestTenantRow extends SupabaseDataRow {
  TestTenantRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TestTenantTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);
}
