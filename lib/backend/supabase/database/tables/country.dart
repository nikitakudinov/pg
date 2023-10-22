import '../database.dart';

class CountryTable extends SupabaseTable<CountryRow> {
  @override
  String get tableName => 'Country';

  @override
  CountryRow createRow(Map<String, dynamic> data) => CountryRow(data);
}

class CountryRow extends SupabaseDataRow {
  CountryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CountryTable();

  String get iso2 => getField<String>('Iso2')!;
  set iso2(String value) => setField<String>('Iso2', value);

  String? get enName => getField<String>('EnName');
  set enName(String? value) => setField<String>('EnName', value);

  String? get ruName => getField<String>('RuName');
  set ruName(String? value) => setField<String>('RuName', value);

  String? get flagLink16x12 => getField<String>('FlagLink16x12');
  set flagLink16x12(String? value) => setField<String>('FlagLink16x12', value);

  String? get flagLink32x24 => getField<String>('FlagLink32x24');
  set flagLink32x24(String? value) => setField<String>('FlagLink32x24', value);

  String? get flagLink48x36 => getField<String>('FlagLink48x36');
  set flagLink48x36(String? value) => setField<String>('FlagLink48x36', value);

  String? get flagLinkH24 => getField<String>('FlagLinkH24');
  set flagLinkH24(String? value) => setField<String>('FlagLinkH24', value);
}
