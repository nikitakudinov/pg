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
    String? chatChattype,
    List<String>? chatMembers,
    String? chatLastMessageSander,
  })  : _chatId = chatId,
        _chatUpdatedAt = chatUpdatedAt,
        _chatLastMessage = chatLastMessage,
        _chatOfTeam = chatOfTeam,
        _chatChattype = chatChattype,
        _chatMembers = chatMembers,
        _chatLastMessageSander = chatLastMessageSander;

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

  // "chat_chattype" field.
  String? _chatChattype;
  String get chatChattype => _chatChattype ?? '';
  set chatChattype(String? val) => _chatChattype = val;
  bool hasChatChattype() => _chatChattype != null;

  // "chat_members" field.
  List<String>? _chatMembers;
  List<String> get chatMembers => _chatMembers ?? const [];
  set chatMembers(List<String>? val) => _chatMembers = val;
  void updateChatMembers(Function(List<String>) updateFn) =>
      updateFn(_chatMembers ??= []);
  bool hasChatMembers() => _chatMembers != null;

  // "chat_last_message_sander" field.
  String? _chatLastMessageSander;
  String get chatLastMessageSander => _chatLastMessageSander ?? '';
  set chatLastMessageSander(String? val) => _chatLastMessageSander = val;
  bool hasChatLastMessageSander() => _chatLastMessageSander != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        chatId: castToType<int>(data['chat_id']),
        chatUpdatedAt: data['chat_updated_at'] as String?,
        chatLastMessage: data['chat_last_message'] as String?,
        chatOfTeam: castToType<int>(data['chat_of_team']),
        chatChattype: data['chat_chattype'] as String?,
        chatMembers: getDataList(data['chat_members']),
        chatLastMessageSander: data['chat_last_message_sander'] as String?,
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'chat_id': _chatId,
        'chat_updated_at': _chatUpdatedAt,
        'chat_last_message': _chatLastMessage,
        'chat_of_team': _chatOfTeam,
        'chat_chattype': _chatChattype,
        'chat_members': _chatMembers,
        'chat_last_message_sander': _chatLastMessageSander,
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
        'chat_chattype': serializeParam(
          _chatChattype,
          ParamType.String,
        ),
        'chat_members': serializeParam(
          _chatMembers,
          ParamType.String,
          true,
        ),
        'chat_last_message_sander': serializeParam(
          _chatLastMessageSander,
          ParamType.String,
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
        chatChattype: deserializeParam(
          data['chat_chattype'],
          ParamType.String,
          false,
        ),
        chatMembers: deserializeParam<String>(
          data['chat_members'],
          ParamType.String,
          true,
        ),
        chatLastMessageSander: deserializeParam(
          data['chat_last_message_sander'],
          ParamType.String,
          false,
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
        chatChattype == other.chatChattype &&
        listEquality.equals(chatMembers, other.chatMembers) &&
        chatLastMessageSander == other.chatLastMessageSander;
  }

  @override
  int get hashCode => const ListEquality().hash([
        chatId,
        chatUpdatedAt,
        chatLastMessage,
        chatOfTeam,
        chatChattype,
        chatMembers,
        chatLastMessageSander
      ]);
}

ChatStruct createChatStruct({
  int? chatId,
  String? chatUpdatedAt,
  String? chatLastMessage,
  int? chatOfTeam,
  String? chatChattype,
  String? chatLastMessageSander,
}) =>
    ChatStruct(
      chatId: chatId,
      chatUpdatedAt: chatUpdatedAt,
      chatLastMessage: chatLastMessage,
      chatOfTeam: chatOfTeam,
      chatChattype: chatChattype,
      chatLastMessageSander: chatLastMessageSander,
    );
