// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends BaseStruct {
  ChatStruct({
    int? chatId,
    String? chatUpdatedAt,
    List<String>? chatMembers,
    String? chatLastMessage,
    int? chatOfTeam,
    int? chatCountOfMembers,
    List<PlayerStruct>? members,
  })  : _chatId = chatId,
        _chatUpdatedAt = chatUpdatedAt,
        _chatMembers = chatMembers,
        _chatLastMessage = chatLastMessage,
        _chatOfTeam = chatOfTeam,
        _chatCountOfMembers = chatCountOfMembers,
        _members = members;

  // "chat_id" field.
  int? _chatId;
  int get chatId => _chatId ?? 0;
  set chatId(int? val) => _chatId = val;
  void incrementChatId(int amount) => _chatId = chatId + amount;
  bool hasChatId() => _chatId != null;

  // "chat_updated_at" field.
  String? _chatUpdatedAt;
  String get chatUpdatedAt => _chatUpdatedAt ?? '';
  set chatUpdatedAt(String? val) => _chatUpdatedAt = val;
  bool hasChatUpdatedAt() => _chatUpdatedAt != null;

  // "chat_members" field.
  List<String>? _chatMembers;
  List<String> get chatMembers => _chatMembers ?? const [];
  set chatMembers(List<String>? val) => _chatMembers = val;
  void updateChatMembers(Function(List<String>) updateFn) =>
      updateFn(_chatMembers ??= []);
  bool hasChatMembers() => _chatMembers != null;

  // "chat_last_message" field.
  String? _chatLastMessage;
  String get chatLastMessage => _chatLastMessage ?? '';
  set chatLastMessage(String? val) => _chatLastMessage = val;
  bool hasChatLastMessage() => _chatLastMessage != null;

  // "chat_of_team" field.
  int? _chatOfTeam;
  int get chatOfTeam => _chatOfTeam ?? 0;
  set chatOfTeam(int? val) => _chatOfTeam = val;
  void incrementChatOfTeam(int amount) => _chatOfTeam = chatOfTeam + amount;
  bool hasChatOfTeam() => _chatOfTeam != null;

  // "chat_count_of_members" field.
  int? _chatCountOfMembers;
  int get chatCountOfMembers => _chatCountOfMembers ?? 0;
  set chatCountOfMembers(int? val) => _chatCountOfMembers = val;
  void incrementChatCountOfMembers(int amount) =>
      _chatCountOfMembers = chatCountOfMembers + amount;
  bool hasChatCountOfMembers() => _chatCountOfMembers != null;

  // "members" field.
  List<PlayerStruct>? _members;
  List<PlayerStruct> get members => _members ?? const [];
  set members(List<PlayerStruct>? val) => _members = val;
  void updateMembers(Function(List<PlayerStruct>) updateFn) =>
      updateFn(_members ??= []);
  bool hasMembers() => _members != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        chatId: castToType<int>(data['chat_id']),
        chatUpdatedAt: data['chat_updated_at'] as String?,
        chatMembers: getDataList(data['chat_members']),
        chatLastMessage: data['chat_last_message'] as String?,
        chatOfTeam: castToType<int>(data['chat_of_team']),
        chatCountOfMembers: castToType<int>(data['chat_count_of_members']),
        members: getStructList(
          data['members'],
          PlayerStruct.fromMap,
        ),
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChatStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'chat_id': _chatId,
        'chat_updated_at': _chatUpdatedAt,
        'chat_members': _chatMembers,
        'chat_last_message': _chatLastMessage,
        'chat_of_team': _chatOfTeam,
        'chat_count_of_members': _chatCountOfMembers,
        'members': _members?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chat_id': serializeParam(
          _chatId,
          ParamType.int,
        ),
        'chat_updated_at': serializeParam(
          _chatUpdatedAt,
          ParamType.String,
        ),
        'chat_members': serializeParam(
          _chatMembers,
          ParamType.String,
          true,
        ),
        'chat_last_message': serializeParam(
          _chatLastMessage,
          ParamType.String,
        ),
        'chat_of_team': serializeParam(
          _chatOfTeam,
          ParamType.int,
        ),
        'chat_count_of_members': serializeParam(
          _chatCountOfMembers,
          ParamType.int,
        ),
        'members': serializeParam(
          _members,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStruct(
        chatId: deserializeParam(
          data['chat_id'],
          ParamType.int,
          false,
        ),
        chatUpdatedAt: deserializeParam(
          data['chat_updated_at'],
          ParamType.String,
          false,
        ),
        chatMembers: deserializeParam<String>(
          data['chat_members'],
          ParamType.String,
          true,
        ),
        chatLastMessage: deserializeParam(
          data['chat_last_message'],
          ParamType.String,
          false,
        ),
        chatOfTeam: deserializeParam(
          data['chat_of_team'],
          ParamType.int,
          false,
        ),
        chatCountOfMembers: deserializeParam(
          data['chat_count_of_members'],
          ParamType.int,
          false,
        ),
        members: deserializeStructParam<PlayerStruct>(
          data['members'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatStruct &&
        chatId == other.chatId &&
        chatUpdatedAt == other.chatUpdatedAt &&
        listEquality.equals(chatMembers, other.chatMembers) &&
        chatLastMessage == other.chatLastMessage &&
        chatOfTeam == other.chatOfTeam &&
        chatCountOfMembers == other.chatCountOfMembers &&
        listEquality.equals(members, other.members);
  }

  @override
  int get hashCode => const ListEquality().hash([
        chatId,
        chatUpdatedAt,
        chatMembers,
        chatLastMessage,
        chatOfTeam,
        chatCountOfMembers,
        members
      ]);
}

ChatStruct createChatStruct({
  int? chatId,
  String? chatUpdatedAt,
  String? chatLastMessage,
  int? chatOfTeam,
  int? chatCountOfMembers,
}) =>
    ChatStruct(
      chatId: chatId,
      chatUpdatedAt: chatUpdatedAt,
      chatLastMessage: chatLastMessage,
      chatOfTeam: chatOfTeam,
      chatCountOfMembers: chatCountOfMembers,
    );
