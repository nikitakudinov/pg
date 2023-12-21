// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountStruct extends BaseStruct {
  CountStruct({
    int? count,
  }) : _count = count;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;
  void incrementCount(int amount) => _count = count + amount;
  bool hasCount() => _count != null;

  static CountStruct fromMap(Map<String, dynamic> data) => CountStruct(
        count: castToType<int>(data['count']),
      );

  static CountStruct? maybeFromMap(dynamic data) =>
      data is Map ? CountStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static CountStruct fromSerializableMap(Map<String, dynamic> data) =>
      CountStruct(
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountStruct && count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([count]);
}

CountStruct createCountStruct({
  int? count,
}) =>
    CountStruct(
      count: count,
    );
