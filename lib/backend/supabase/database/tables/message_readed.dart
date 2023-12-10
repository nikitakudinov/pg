import '../database.dart';

class MessageReadedTable extends SupabaseTable<MessageReadedRow> {
  @override
  String get tableName => 'message_readed';

  @override
  MessageReadedRow createRow(Map<String, dynamic> data) =>
      MessageReadedRow(data);
}

class MessageReadedRow extends SupabaseDataRow {
  MessageReadedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessageReadedTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get messageId => getField<int>('message_id')!;
  set messageId(int value) => setField<int>('message_id', value);

  String get playerUid => getField<String>('player_uid')!;
  set playerUid(String value) => setField<String>('player_uid', value);
}
