import '../database.dart';

class ChatMembersTable extends SupabaseTable<ChatMembersRow> {
  @override
  String get tableName => 'chat_members';

  @override
  ChatMembersRow createRow(Map<String, dynamic> data) => ChatMembersRow(data);
}

class ChatMembersRow extends SupabaseDataRow {
  ChatMembersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatMembersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get chatId => getField<int>('chat_id')!;
  set chatId(int value) => setField<int>('chat_id', value);

  String get playerUid => getField<String>('player_uid')!;
  set playerUid(String value) => setField<String>('player_uid', value);
}
