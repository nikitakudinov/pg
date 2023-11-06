// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatmemberStruct extends BaseStruct {
  ChatmemberStruct({
    int? userId,
    String? uid,
    String? nickname,
  })  : _userId = userId,
        _uid = uid,
        _nickname = nickname;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;
  void incrementUserId(int amount) => _userId = userId + amount;
  bool hasUserId() => _userId != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  set nickname(String? val) => _nickname = val;
  bool hasNickname() => _nickname != null;

  static ChatmemberStruct fromMap(Map<String, dynamic> data) =>
      ChatmemberStruct(
        userId: castToType<int>(data['user_id']),
        uid: data['uid'] as String?,
        nickname: data['nickname'] as String?,
      );

  static ChatmemberStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChatmemberStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'uid': _uid,
        'nickname': _nickname,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'nickname': serializeParam(
          _nickname,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatmemberStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatmemberStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        nickname: deserializeParam(
          data['nickname'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatmemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatmemberStruct &&
        userId == other.userId &&
        uid == other.uid &&
        nickname == other.nickname;
  }

  @override
  int get hashCode => const ListEquality().hash([userId, uid, nickname]);
}

ChatmemberStruct createChatmemberStruct({
  int? userId,
  String? uid,
  String? nickname,
}) =>
    ChatmemberStruct(
      userId: userId,
      uid: uid,
      nickname: nickname,
    );
