import '../database.dart';

class AeSearchResultsTable extends SupabaseTable<AeSearchResultsRow> {
  @override
  String get tableName => 'ae_search_results';

  @override
  AeSearchResultsRow createRow(Map<String, dynamic> data) =>
      AeSearchResultsRow(data);
}

class AeSearchResultsRow extends SupabaseDataRow {
  AeSearchResultsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AeSearchResultsTable();

  String get offerKey => getField<String>('offer_key')!;
  set offerKey(String value) => setField<String>('offer_key', value);

  int? get stock => getField<int>('stock');
  set stock(int? value) => setField<int>('stock', value);

  String? get cross => getField<String>('cross');
  set cross(String? value) => setField<String>('cross', value);

  String? get brand => getField<String>('brand');
  set brand(String? value) => setField<String>('brand', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get packing => getField<int>('packing');
  set packing(int? value) => setField<int>('packing', value);

  String? get price => getField<String>('price');
  set price(String? value) => setField<String>('price', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  int? get amount => getField<int>('amount');
  set amount(int? value) => setField<int>('amount', value);

  String? get unit => getField<String>('unit');
  set unit(String? value) => setField<String>('unit', value);

  int? get returnField => getField<int>('return');
  set returnField(int? value) => setField<int>('return', value);

  String? get orderBefore => getField<String>('order_before');
  set orderBefore(String? value) => setField<String>('order_before', value);

  String? get deliveryTime => getField<String>('delivery_time');
  set deliveryTime(String? value) => setField<String>('delivery_time', value);

  String? get deliveryTimeMax => getField<String>('delivery_time_max');
  set deliveryTimeMax(String? value) =>
      setField<String>('delivery_time_max', value);

  double? get rejects => getField<double>('rejects');
  set rejects(double? value) => setField<double>('rejects', value);

  int? get dealer => getField<int>('dealer');
  set dealer(int? value) => setField<int>('dealer', value);

  String? get warehouseName => getField<String>('warehouse_name');
  set warehouseName(String? value) => setField<String>('warehouse_name', value);

  String? get warehouseKey => getField<String>('warehouse_key');
  set warehouseKey(String? value) => setField<String>('warehouse_key', value);

  int? get ttl => getField<int>('ttl');
  set ttl(int? value) => setField<int>('ttl', value);
}
