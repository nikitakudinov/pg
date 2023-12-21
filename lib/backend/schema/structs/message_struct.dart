// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageStruct extends BaseStruct {
  MessageStruct({
    int? messageId,
    String? messageSander,
    String? messageBody,
    int? messageChat,
    String? messageType,
    List<String>? messageReadedBy,
    String? messageSanderAvatar,
    String? messageSandedAt,
    List<MessageReadedStruct>? messageReaded,
  })  : _messageId = messageId,
        _messageSander = messageSander,
        _messageBody = messageBody,
        _messageChat = messageChat,
        _messageType = messageType,
        _messageReadedBy = messageReadedBy,
        _messageSanderAvatar = messageSanderAvatar,
        _messageSandedAt = messageSandedAt,
        _messageReaded = messageReaded;

  // "message_id" field.
  int? _messageId;
  int get messageId => _messageId ?? 0;
  set messageId(int? val) => _messageId = val;
  void incrementMessageId(int amount) => _messageId = messageId + amount;
  bool hasMessageId() => _messageId != null;

  // "message_sander" field.
  String? _messageSander;
  String get messageSander => _messageSander ?? '';
  set messageSander(String? val) => _messageSander = val;
  bool hasMessageSander() => _messageSander != null;

  // "message_body" field.
  String? _messageBody;
  String get messageBody => _messageBody ?? '';
  set messageBody(String? val) => _messageBody = val;
  bool hasMessageBody() => _messageBody != null;

  // "message_chat" field.
  int? _messageChat;
  int get messageChat => _messageChat ?? 0;
  set messageChat(int? val) => _messageChat = val;
  void incrementMessageChat(int amount) => _messageChat = messageChat + amount;
  bool hasMessageChat() => _messageChat != null;

  // "message_type" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  set messageType(String? val) => _messageType = val;
  bool hasMessageType() => _messageType != null;

  // "message_readedBy" field.
  List<String>? _messageReadedBy;
  List<String> get messageReadedBy => _messageReadedBy ?? const [];
  set messageReadedBy(List<String>? val) => _messageReadedBy = val;
  void updateMessageReadedBy(Function(List<String>) updateFn) =>
      updateFn(_messageReadedBy ??= []);
  bool hasMessageReadedBy() => _messageReadedBy != null;

  // "message_sander_avatar" field.
  String? _messageSanderAvatar;
  String get messageSanderAvatar => _messageSanderAvatar ?? '';
  set messageSanderAvatar(String? val) => _messageSanderAvatar = val;
  bool hasMessageSanderAvatar() => _messageSanderAvatar != null;

  // "message_sanded_at" field.
  String? _messageSandedAt;
  String get messageSandedAt => _messageSandedAt ?? '';
  set messageSandedAt(String? val) => _messageSandedAt = val;
  bool hasMessageSandedAt() => _messageSandedAt != null;

  // "message_readed" field.
  List<MessageReadedStruct>? _messageReaded;
  List<MessageReadedStruct> get messageReaded => _messageReaded ?? const [];
  set messageReaded(List<MessageReadedStruct>? val) => _messageReaded = val;
  void updateMessageReaded(Function(List<MessageReadedStruct>) updateFn) =>
      updateFn(_messageReaded ??= []);
  bool hasMessageReaded() => _messageReaded != null;

  static MessageStruct fromMap(Map<String, dynamic> data) => MessageStruct(
        messageId: castToType<int>(data['message_id']),
        messageSander: data['message_sander'] as String?,
        messageBody: data['message_body'] as String?,
        messageChat: castToType<int>(data['message_chat']),
        messageType: data['message_type'] as String?,
        messageReadedBy: getDataList(data['message_readedBy']),
        messageSanderAvatar: data['message_sander_avatar'] as String?,
        messageSandedAt: data['message_sanded_at'] as String?,
        messageReaded: getStructList(
          data['message_readed'],
          MessageReadedStruct.fromMap,
        ),
      );

  static MessageStruct? maybeFromMap(dynamic data) =>
      data is Map ? MessageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'message_id': _messageId,
        'message_sander': _messageSander,
        'message_body': _messageBody,
        'message_chat': _messageChat,
        'message_type': _messageType,
        'message_readedBy': _messageReadedBy,
        'message_sander_avatar': _messageSanderAvatar,
        'message_sanded_at': _messageSandedAt,
        'message_readed': _messageReaded?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message_id': serializeParam(
          _messageId,
          ParamType.int,
        ),
        'message_sander': serializeParam(
          _messageSander,
          ParamType.String,
        ),
        'message_body': serializeParam(
          _messageBody,
          ParamType.String,
        ),
        'message_chat': serializeParam(
          _messageChat,
          ParamType.int,
        ),
        'message_type': serializeParam(
          _messageType,
          ParamType.String,
        ),
        'message_readedBy': serializeParam(
          _messageReadedBy,
          ParamType.String,
          true,
        ),
        'message_sander_avatar': serializeParam(
          _messageSanderAvatar,
          ParamType.String,
        ),
        'message_sanded_at': serializeParam(
          _messageSandedAt,
          ParamType.String,
        ),
        'message_readed': serializeParam(
          _messageReaded,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static MessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageStruct(
        messageId: deserializeParam(
          data['message_id'],
          ParamType.int,
          false,
        ),
        messageSander: deserializeParam(
          data['message_sander'],
          ParamType.String,
          false,
        ),
        messageBody: deserializeParam(
          data['message_body'],
          ParamType.String,
          false,
        ),
        messageChat: deserializeParam(
          data['message_chat'],
          ParamType.int,
          false,
        ),
        messageType: deserializeParam(
          data['message_type'],
          ParamType.String,
          false,
        ),
        messageReadedBy: deserializeParam<String>(
          data['message_readedBy'],
          ParamType.String,
          true,
        ),
        messageSanderAvatar: deserializeParam(
          data['message_sander_avatar'],
          ParamType.String,
          false,
        ),
        messageSandedAt: deserializeParam(
          data['message_sanded_at'],
          ParamType.String,
          false,
        ),
        messageReaded: deserializeStructParam<MessageReadedStruct>(
          data['message_readed'],
          ParamType.DataStruct,
          true,
          structBuilder: MessageReadedStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MessageStruct &&
        messageId == other.messageId &&
        messageSander == other.messageSander &&
        messageBody == other.messageBody &&
        messageChat == other.messageChat &&
        messageType == other.messageType &&
        listEquality.equals(messageReadedBy, other.messageReadedBy) &&
        messageSanderAvatar == other.messageSanderAvatar &&
        messageSandedAt == other.messageSandedAt &&
        listEquality.equals(messageReaded, other.messageReaded);
  }

  @override
  int get hashCode => const ListEquality().hash([
        messageId,
        messageSander,
        messageBody,
        messageChat,
        messageType,
        messageReadedBy,
        messageSanderAvatar,
        messageSandedAt,
        messageReaded
      ]);
}

MessageStruct createMessageStruct({
  int? messageId,
  String? messageSander,
  String? messageBody,
  int? messageChat,
  String? messageType,
  String? messageSanderAvatar,
  String? messageSandedAt,
}) =>
    MessageStruct(
      messageId: messageId,
      messageSander: messageSander,
      messageBody: messageBody,
      messageChat: messageChat,
      messageType: messageType,
      messageSanderAvatar: messageSanderAvatar,
      messageSandedAt: messageSandedAt,
    );
