// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageStruct extends BaseStruct {
  MessageStruct({
    int? messageId,
    String? messageSandedAt,
    String? messageSander,
    int? messageBody,
    String? messageChat,
    String? messageSanderAvatar,
    String? messageType,
    String? messageParametrSTRING1,
    int? messageParametrINT1,
    String? messageToPlayer,
  })  : _messageId = messageId,
        _messageSandedAt = messageSandedAt,
        _messageSander = messageSander,
        _messageBody = messageBody,
        _messageChat = messageChat,
        _messageSanderAvatar = messageSanderAvatar,
        _messageType = messageType,
        _messageParametrSTRING1 = messageParametrSTRING1,
        _messageParametrINT1 = messageParametrINT1,
        _messageToPlayer = messageToPlayer;

  // "message_id" field.
  int? _messageId;
  int get messageId => _messageId ?? 0;
  set messageId(int? val) => _messageId = val;
  void incrementMessageId(int amount) => _messageId = messageId + amount;
  bool hasMessageId() => _messageId != null;

  // "message_sanded_at" field.
  String? _messageSandedAt;
  String get messageSandedAt => _messageSandedAt ?? '';
  set messageSandedAt(String? val) => _messageSandedAt = val;
  bool hasMessageSandedAt() => _messageSandedAt != null;

  // "message_sander" field.
  String? _messageSander;
  String get messageSander => _messageSander ?? '';
  set messageSander(String? val) => _messageSander = val;
  bool hasMessageSander() => _messageSander != null;

  // "message_body" field.
  int? _messageBody;
  int get messageBody => _messageBody ?? 0;
  set messageBody(int? val) => _messageBody = val;
  void incrementMessageBody(int amount) => _messageBody = messageBody + amount;
  bool hasMessageBody() => _messageBody != null;

  // "message_chat" field.
  String? _messageChat;
  String get messageChat => _messageChat ?? '';
  set messageChat(String? val) => _messageChat = val;
  bool hasMessageChat() => _messageChat != null;

  // "message_sander_avatar" field.
  String? _messageSanderAvatar;
  String get messageSanderAvatar => _messageSanderAvatar ?? '';
  set messageSanderAvatar(String? val) => _messageSanderAvatar = val;
  bool hasMessageSanderAvatar() => _messageSanderAvatar != null;

  // "message_type" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  set messageType(String? val) => _messageType = val;
  bool hasMessageType() => _messageType != null;

  // "message_parametrSTRING1" field.
  String? _messageParametrSTRING1;
  String get messageParametrSTRING1 => _messageParametrSTRING1 ?? '';
  set messageParametrSTRING1(String? val) => _messageParametrSTRING1 = val;
  bool hasMessageParametrSTRING1() => _messageParametrSTRING1 != null;

  // "message_parametrINT1" field.
  int? _messageParametrINT1;
  int get messageParametrINT1 => _messageParametrINT1 ?? 0;
  set messageParametrINT1(int? val) => _messageParametrINT1 = val;
  void incrementMessageParametrINT1(int amount) =>
      _messageParametrINT1 = messageParametrINT1 + amount;
  bool hasMessageParametrINT1() => _messageParametrINT1 != null;

  // "message_to_player" field.
  String? _messageToPlayer;
  String get messageToPlayer => _messageToPlayer ?? '';
  set messageToPlayer(String? val) => _messageToPlayer = val;
  bool hasMessageToPlayer() => _messageToPlayer != null;

  static MessageStruct fromMap(Map<String, dynamic> data) => MessageStruct(
        messageId: castToType<int>(data['message_id']),
        messageSandedAt: data['message_sanded_at'] as String?,
        messageSander: data['message_sander'] as String?,
        messageBody: castToType<int>(data['message_body']),
        messageChat: data['message_chat'] as String?,
        messageSanderAvatar: data['message_sander_avatar'] as String?,
        messageType: data['message_type'] as String?,
        messageParametrSTRING1: data['message_parametrSTRING1'] as String?,
        messageParametrINT1: castToType<int>(data['message_parametrINT1']),
        messageToPlayer: data['message_to_player'] as String?,
      );

  static MessageStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MessageStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'message_id': _messageId,
        'message_sanded_at': _messageSandedAt,
        'message_sander': _messageSander,
        'message_body': _messageBody,
        'message_chat': _messageChat,
        'message_sander_avatar': _messageSanderAvatar,
        'message_type': _messageType,
        'message_parametrSTRING1': _messageParametrSTRING1,
        'message_parametrINT1': _messageParametrINT1,
        'message_to_player': _messageToPlayer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message_id': serializeParam(
          _messageId,
          ParamType.int,
        ),
        'message_sanded_at': serializeParam(
          _messageSandedAt,
          ParamType.String,
        ),
        'message_sander': serializeParam(
          _messageSander,
          ParamType.String,
        ),
        'message_body': serializeParam(
          _messageBody,
          ParamType.int,
        ),
        'message_chat': serializeParam(
          _messageChat,
          ParamType.String,
        ),
        'message_sander_avatar': serializeParam(
          _messageSanderAvatar,
          ParamType.String,
        ),
        'message_type': serializeParam(
          _messageType,
          ParamType.String,
        ),
        'message_parametrSTRING1': serializeParam(
          _messageParametrSTRING1,
          ParamType.String,
        ),
        'message_parametrINT1': serializeParam(
          _messageParametrINT1,
          ParamType.int,
        ),
        'message_to_player': serializeParam(
          _messageToPlayer,
          ParamType.String,
        ),
      }.withoutNulls;

  static MessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageStruct(
        messageId: deserializeParam(
          data['message_id'],
          ParamType.int,
          false,
        ),
        messageSandedAt: deserializeParam(
          data['message_sanded_at'],
          ParamType.String,
          false,
        ),
        messageSander: deserializeParam(
          data['message_sander'],
          ParamType.String,
          false,
        ),
        messageBody: deserializeParam(
          data['message_body'],
          ParamType.int,
          false,
        ),
        messageChat: deserializeParam(
          data['message_chat'],
          ParamType.String,
          false,
        ),
        messageSanderAvatar: deserializeParam(
          data['message_sander_avatar'],
          ParamType.String,
          false,
        ),
        messageType: deserializeParam(
          data['message_type'],
          ParamType.String,
          false,
        ),
        messageParametrSTRING1: deserializeParam(
          data['message_parametrSTRING1'],
          ParamType.String,
          false,
        ),
        messageParametrINT1: deserializeParam(
          data['message_parametrINT1'],
          ParamType.int,
          false,
        ),
        messageToPlayer: deserializeParam(
          data['message_to_player'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageStruct &&
        messageId == other.messageId &&
        messageSandedAt == other.messageSandedAt &&
        messageSander == other.messageSander &&
        messageBody == other.messageBody &&
        messageChat == other.messageChat &&
        messageSanderAvatar == other.messageSanderAvatar &&
        messageType == other.messageType &&
        messageParametrSTRING1 == other.messageParametrSTRING1 &&
        messageParametrINT1 == other.messageParametrINT1 &&
        messageToPlayer == other.messageToPlayer;
  }

  @override
  int get hashCode => const ListEquality().hash([
        messageId,
        messageSandedAt,
        messageSander,
        messageBody,
        messageChat,
        messageSanderAvatar,
        messageType,
        messageParametrSTRING1,
        messageParametrINT1,
        messageToPlayer
      ]);
}

MessageStruct createMessageStruct({
  int? messageId,
  String? messageSandedAt,
  String? messageSander,
  int? messageBody,
  String? messageChat,
  String? messageSanderAvatar,
  String? messageType,
  String? messageParametrSTRING1,
  int? messageParametrINT1,
  String? messageToPlayer,
}) =>
    MessageStruct(
      messageId: messageId,
      messageSandedAt: messageSandedAt,
      messageSander: messageSander,
      messageBody: messageBody,
      messageChat: messageChat,
      messageSanderAvatar: messageSanderAvatar,
      messageType: messageType,
      messageParametrSTRING1: messageParametrSTRING1,
      messageParametrINT1: messageParametrINT1,
      messageToPlayer: messageToPlayer,
    );