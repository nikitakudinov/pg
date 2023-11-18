import '../database.dart';

class MessageTable extends SupabaseTable<MessageRow> {
  @override
  String get tableName => 'message';

  @override
  MessageRow createRow(Map<String, dynamic> data) => MessageRow(data);
}

class MessageRow extends SupabaseDataRow {
  MessageRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessageTable();

  int get messageD => getField<int>('message_d')!;
  set messageD(int value) => setField<int>('message_d', value);

  DateTime get messageSandedAt => getField<DateTime>('message_sanded_at')!;
  set messageSandedAt(DateTime value) =>
      setField<DateTime>('message_sanded_at', value);

  String? get messageSander => getField<String>('message_sander');
  set messageSander(String? value) => setField<String>('message_sander', value);

  String? get messageBody => getField<String>('message_body');
  set messageBody(String? value) => setField<String>('message_body', value);

  int? get messageChat => getField<int>('message_chat');
  set messageChat(int? value) => setField<int>('message_chat', value);
}
