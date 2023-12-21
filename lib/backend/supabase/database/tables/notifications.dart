import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsTable();

  int get notificationId => getField<int>('notification_id')!;
  set notificationId(int value) => setField<int>('notification_id', value);

  DateTime get notificationCreatedAt =>
      getField<DateTime>('notification_created_at')!;
  set notificationCreatedAt(DateTime value) =>
      setField<DateTime>('notification_created_at', value);

  int? get notificationFromTeam => getField<int>('notification_from_team');
  set notificationFromTeam(int? value) =>
      setField<int>('notification_from_team', value);

  String? get notificationFromPlayer =>
      getField<String>('notification_from_player');
  set notificationFromPlayer(String? value) =>
      setField<String>('notification_from_player', value);

  int? get notificationFromTournament =>
      getField<int>('notification_from_tournament');
  set notificationFromTournament(int? value) =>
      setField<int>('notification_from_tournament', value);

  String? get notificationToPlayer =>
      getField<String>('notification_to_player');
  set notificationToPlayer(String? value) =>
      setField<String>('notification_to_player', value);

  String? get notificationType => getField<String>('notification_type');
  set notificationType(String? value) =>
      setField<String>('notification_type', value);

  String? get notificationBody => getField<String>('notification_body');
  set notificationBody(String? value) =>
      setField<String>('notification_body', value);

  String? get notificationCategory => getField<String>('notification_category');
  set notificationCategory(String? value) =>
      setField<String>('notification_category', value);

  int? get notificationMatchId => getField<int>('notification_match_id');
  set notificationMatchId(int? value) =>
      setField<int>('notification_match_id', value);
}
