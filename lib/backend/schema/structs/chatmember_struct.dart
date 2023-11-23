// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatmemberStruct extends BaseStruct {
  ChatmemberStruct({
    PlayerStruct? member,
  }) : _member = member;

  // "member" field.
  PlayerStruct? _member;
  PlayerStruct get member => _member ?? PlayerStruct();
  set member(PlayerStruct? val) => _member = val;
  void updateMember(Function(PlayerStruct) updateFn) =>
      updateFn(_member ??= PlayerStruct());
  bool hasMember() => _member != null;

  static ChatmemberStruct fromMap(Map<String, dynamic> data) =>
      ChatmemberStruct(
        member: PlayerStruct.maybeFromMap(data['member']),
      );

  static ChatmemberStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChatmemberStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'member': _member?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'member': serializeParam(
          _member,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ChatmemberStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatmemberStruct(
        member: deserializeStructParam(
          data['member'],
          ParamType.DataStruct,
          false,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ChatmemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatmemberStruct && member == other.member;
  }

  @override
  int get hashCode => const ListEquality().hash([member]);
}

ChatmemberStruct createChatmemberStruct({
  PlayerStruct? member,
}) =>
    ChatmemberStruct(
      member: member ?? PlayerStruct(),
    );
