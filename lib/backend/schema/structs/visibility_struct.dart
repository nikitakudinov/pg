// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisibilityStruct extends BaseStruct {
  VisibilityStruct({
    bool? loadingIndicator,
  }) : _loadingIndicator = loadingIndicator;

  // "LOADING-INDICATOR" field.
  bool? _loadingIndicator;
  bool get loadingIndicator => _loadingIndicator ?? false;
  set loadingIndicator(bool? val) => _loadingIndicator = val;
  bool hasLoadingIndicator() => _loadingIndicator != null;

  static VisibilityStruct fromMap(Map<String, dynamic> data) =>
      VisibilityStruct(
        loadingIndicator: data['LOADING-INDICATOR'] as bool?,
      );

  static VisibilityStruct? maybeFromMap(dynamic data) => data is Map
      ? VisibilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'LOADING-INDICATOR': _loadingIndicator,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'LOADING-INDICATOR': serializeParam(
          _loadingIndicator,
          ParamType.bool,
        ),
      }.withoutNulls;

  static VisibilityStruct fromSerializableMap(Map<String, dynamic> data) =>
      VisibilityStruct(
        loadingIndicator: deserializeParam(
          data['LOADING-INDICATOR'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'VisibilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VisibilityStruct &&
        loadingIndicator == other.loadingIndicator;
  }

  @override
  int get hashCode => const ListEquality().hash([loadingIndicator]);
}

VisibilityStruct createVisibilityStruct({
  bool? loadingIndicator,
}) =>
    VisibilityStruct(
      loadingIndicator: loadingIndicator,
    );
