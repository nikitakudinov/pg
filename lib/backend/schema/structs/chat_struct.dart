// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends BaseStruct {
  ChatStruct({
    int? chatId,
    String? chatUpdatedAt,
    String? chatLastMessage,
    int? chatOfTeam,
    List<PlayerStruct>? members,
    String? chatType,
    List<ChatmemberStruct>? chatMembers,
  })  : _chatId = chatId,
        _chatUpdatedAt = chatUpdatedAt,
        _chatLastMessage = chatLastMessage,
        _chatOfTeam = chatOfTeam,
        _members = members,
        _chatType = chatType,
        _chatMembers = chatMembers;

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

  // "members" field.
  List<PlayerStruct>? _members;
  List<PlayerStruct> get members => _members ?? const [];
  set members(List<PlayerStruct>? val) => _members = val;
  void updateMembers(Function(List<PlayerStruct>) updateFn) =>
      updateFn(_members ??= []);
  bool hasMembers() => _members != null;

  // "chat_type" field.
  String? _chatType;
  String get chatType => _chatType ?? '';
  set chatType(String? val) => _chatType = val;
  bool hasChatType() => _chatType != null;

  // "chat_members" field.
  List<ChatmemberStruct>? _chatMembers;
  List<ChatmemberStruct> get chatMembers => _chatMembers ?? const [];
  set chatMembers(List<ChatmemberStruct>? val) => _chatMembers = val;
  void updateChatMembers(Function(List<ChatmemberStruct>) updateFn) =>
      updateFn(_chatMembers ??= []);
  bool hasChatMembers() => _chatMembers != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        chatId: castToType<int>(data['chat_id']),
        chatUpdatedAt: data['chat_updated_at'] as String?,
        chatLastMessage: data['chat_last_message'] as String?,
        chatOfTeam: castToType<int>(data['chat_of_team']),
        members: getStructList(
          data['members'],
          PlayerStruct.fromMap,
        ),
        chatType: data['chat_type'] as String?,
        chatMembers: getStructList(
          data['chat_members'],
          ChatmemberStruct.fromMap,
        ),
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChatStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'chat_id': _chatId,
        'chat_updated_at': _chatUpdatedAt,
        'chat_last_message': _chatLastMessage,
        'chat_of_team': _chatOfTeam,
        'members': _members?.map((e) => e.toMap()).toList(),
        'chat_type': _chatType,
        'chat_members': _chatMembers?.map((e) => e.toMap()).toList(),
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
        'chat_last_message': serializeParam(
          _chatLastMessage,
          ParamType.String,
        ),
        'chat_of_team': serializeParam(
          _chatOfTeam,
          ParamType.int,
        ),
        'members': serializeParam(
          _members,
          ParamType.DataStruct,
          true,
        ),
        'chat_type': serializeParam(
          _chatType,
          ParamType.String,
        ),
        'chat_members': serializeParam(
          _chatMembers,
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
        members: deserializeStructParam<PlayerStruct>(
          data['members'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        chatType: deserializeParam(
          data['chat_type'],
          ParamType.String,
          false,
        ),
        chatMembers: deserializeStructParam<ChatmemberStruct>(
          data['chat_members'],
          ParamType.DataStruct,
          true,
          structBuilder: ChatmemberStruct.fromSerializableMap,
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
        chatLastMessage == other.chatLastMessage &&
        chatOfTeam == other.chatOfTeam &&
        listEquality.equals(members, other.members) &&
        chatType == other.chatType &&
        listEquality.equals(chatMembers, other.chatMembers);
  }

  @override
  int get hashCode => const ListEquality().hash([
        chatId,
        chatUpdatedAt,
        chatLastMessage,
        chatOfTeam,
        members,
        chatType,
        chatMembers
      ]);
}

ChatStruct createChatStruct({
  int? chatId,
  String? chatUpdatedAt,
  String? chatLastMessage,
  int? chatOfTeam,
  String? chatType,
}) =>
    ChatStruct(
      chatId: chatId,
      chatUpdatedAt: chatUpdatedAt,
      chatLastMessage: chatLastMessage,
      chatOfTeam: chatOfTeam,
      chatType: chatType,
    );
