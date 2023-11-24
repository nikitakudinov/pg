import '../database.dart';

class MessageReadedByTable extends SupabaseTable<MessageReadedByRow> {
  @override
  String get tableName => 'message_readedBy';

  @override
  MessageReadedByRow createRow(Map<String, dynamic> data) =>
      MessageReadedByRow(data);
}

class MessageReadedByRow extends SupabaseDataRow {
  MessageReadedByRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessageReadedByTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get messageId => getField<int>('message_id')!;
  set messageId(int value) => setField<int>('message_id', value);

  String get playerUid => getField<String>('player_uid')!;
  set playerUid(String value) => setField<String>('player_uid', value);
}
