// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestDataTypeStruct extends BaseStruct {
  TestDataTypeStruct({
    int? seq,
  }) : _seq = seq;

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  set seq(int? val) => _seq = val;
  void incrementSeq(int amount) => _seq = seq + amount;
  bool hasSeq() => _seq != null;

  static TestDataTypeStruct fromMap(Map<String, dynamic> data) =>
      TestDataTypeStruct(
        seq: castToType<int>(data['seq']),
      );

  static TestDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TestDataTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'seq': _seq,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'seq': serializeParam(
          _seq,
          ParamType.int,
        ),
      }.withoutNulls;

  static TestDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestDataTypeStruct(
        seq: deserializeParam(
          data['seq'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TestDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestDataTypeStruct && seq == other.seq;
  }

  @override
  int get hashCode => const ListEquality().hash([seq]);
}

TestDataTypeStruct createTestDataTypeStruct({
  int? seq,
}) =>
    TestDataTypeStruct(
      seq: seq,
    );
