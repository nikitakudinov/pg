// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    int? id,
    String? createdAt,
    String? email,
    String? nickname,
    String? tag,
    int? team,
    String? uid,
    String? avatar,
  })  : _id = id,
        _createdAt = createdAt,
        _email = email,
        _nickname = nickname,
        _tag = tag,
        _team = team,
        _uid = uid,
        _avatar = avatar;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  set nickname(String? val) => _nickname = val;
  bool hasNickname() => _nickname != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;
  bool hasTag() => _tag != null;

  // "team" field.
  int? _team;
  int get team => _team ?? 0;
  set team(int? val) => _team = val;
  void incrementTeam(int amount) => _team = team + amount;
  bool hasTeam() => _team != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;
  bool hasAvatar() => _avatar != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as String?,
        email: data['email'] as String?,
        nickname: data['nickname'] as String?,
        tag: data['tag'] as String?,
        team: castToType<int>(data['team']),
        uid: data['uid'] as String?,
        avatar: data['avatar'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'email': _email,
        'nickname': _nickname,
        'tag': _tag,
        'team': _team,
        'uid': _uid,
        'avatar': _avatar,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'nickname': serializeParam(
          _nickname,
          ParamType.String,
        ),
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'team': serializeParam(
          _team,
          ParamType.int,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        nickname: deserializeParam(
          data['nickname'],
          ParamType.String,
          false,
        ),
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        team: deserializeParam(
          data['team'],
          ParamType.int,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        email == other.email &&
        nickname == other.nickname &&
        tag == other.tag &&
        team == other.team &&
        uid == other.uid &&
        avatar == other.avatar;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, createdAt, email, nickname, tag, team, uid, avatar]);
}

UserStruct createUserStruct({
  int? id,
  String? createdAt,
  String? email,
  String? nickname,
  String? tag,
  int? team,
  String? uid,
  String? avatar,
}) =>
    UserStruct(
      id: id,
      createdAt: createdAt,
      email: email,
      nickname: nickname,
      tag: tag,
      team: team,
      uid: uid,
      avatar: avatar,
    );
