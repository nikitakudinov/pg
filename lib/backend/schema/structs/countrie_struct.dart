// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountrieStruct extends BaseStruct {
  CountrieStruct({
    String? iso2,
    String? enName,
    String? ruName,
    String? flagLink16x12,
    String? flagLink32x24,
    String? flagLink48x36,
    String? flagLinkH24,
  })  : _iso2 = iso2,
        _enName = enName,
        _ruName = ruName,
        _flagLink16x12 = flagLink16x12,
        _flagLink32x24 = flagLink32x24,
        _flagLink48x36 = flagLink48x36,
        _flagLinkH24 = flagLinkH24;

  // "Iso2" field.
  String? _iso2;
  String get iso2 => _iso2 ?? '';
  set iso2(String? val) => _iso2 = val;
  bool hasIso2() => _iso2 != null;

  // "EnName" field.
  String? _enName;
  String get enName => _enName ?? '';
  set enName(String? val) => _enName = val;
  bool hasEnName() => _enName != null;

  // "RuName" field.
  String? _ruName;
  String get ruName => _ruName ?? '';
  set ruName(String? val) => _ruName = val;
  bool hasRuName() => _ruName != null;

  // "FlagLink16x12" field.
  String? _flagLink16x12;
  String get flagLink16x12 => _flagLink16x12 ?? '';
  set flagLink16x12(String? val) => _flagLink16x12 = val;
  bool hasFlagLink16x12() => _flagLink16x12 != null;

  // "FlagLink32x24" field.
  String? _flagLink32x24;
  String get flagLink32x24 => _flagLink32x24 ?? '';
  set flagLink32x24(String? val) => _flagLink32x24 = val;
  bool hasFlagLink32x24() => _flagLink32x24 != null;

  // "FlagLink48x36" field.
  String? _flagLink48x36;
  String get flagLink48x36 => _flagLink48x36 ?? '';
  set flagLink48x36(String? val) => _flagLink48x36 = val;
  bool hasFlagLink48x36() => _flagLink48x36 != null;

  // "FlagLinkH24" field.
  String? _flagLinkH24;
  String get flagLinkH24 => _flagLinkH24 ?? '';
  set flagLinkH24(String? val) => _flagLinkH24 = val;
  bool hasFlagLinkH24() => _flagLinkH24 != null;

  static CountrieStruct fromMap(Map<String, dynamic> data) => CountrieStruct(
        iso2: data['Iso2'] as String?,
        enName: data['EnName'] as String?,
        ruName: data['RuName'] as String?,
        flagLink16x12: data['FlagLink16x12'] as String?,
        flagLink32x24: data['FlagLink32x24'] as String?,
        flagLink48x36: data['FlagLink48x36'] as String?,
        flagLinkH24: data['FlagLinkH24'] as String?,
      );

  static CountrieStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CountrieStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Iso2': _iso2,
        'EnName': _enName,
        'RuName': _ruName,
        'FlagLink16x12': _flagLink16x12,
        'FlagLink32x24': _flagLink32x24,
        'FlagLink48x36': _flagLink48x36,
        'FlagLinkH24': _flagLinkH24,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Iso2': serializeParam(
          _iso2,
          ParamType.String,
        ),
        'EnName': serializeParam(
          _enName,
          ParamType.String,
        ),
        'RuName': serializeParam(
          _ruName,
          ParamType.String,
        ),
        'FlagLink16x12': serializeParam(
          _flagLink16x12,
          ParamType.String,
        ),
        'FlagLink32x24': serializeParam(
          _flagLink32x24,
          ParamType.String,
        ),
        'FlagLink48x36': serializeParam(
          _flagLink48x36,
          ParamType.String,
        ),
        'FlagLinkH24': serializeParam(
          _flagLinkH24,
          ParamType.String,
        ),
      }.withoutNulls;

  static CountrieStruct fromSerializableMap(Map<String, dynamic> data) =>
      CountrieStruct(
        iso2: deserializeParam(
          data['Iso2'],
          ParamType.String,
          false,
        ),
        enName: deserializeParam(
          data['EnName'],
          ParamType.String,
          false,
        ),
        ruName: deserializeParam(
          data['RuName'],
          ParamType.String,
          false,
        ),
        flagLink16x12: deserializeParam(
          data['FlagLink16x12'],
          ParamType.String,
          false,
        ),
        flagLink32x24: deserializeParam(
          data['FlagLink32x24'],
          ParamType.String,
          false,
        ),
        flagLink48x36: deserializeParam(
          data['FlagLink48x36'],
          ParamType.String,
          false,
        ),
        flagLinkH24: deserializeParam(
          data['FlagLinkH24'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CountrieStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountrieStruct &&
        iso2 == other.iso2 &&
        enName == other.enName &&
        ruName == other.ruName &&
        flagLink16x12 == other.flagLink16x12 &&
        flagLink32x24 == other.flagLink32x24 &&
        flagLink48x36 == other.flagLink48x36 &&
        flagLinkH24 == other.flagLinkH24;
  }

  @override
  int get hashCode => const ListEquality().hash([
        iso2,
        enName,
        ruName,
        flagLink16x12,
        flagLink32x24,
        flagLink48x36,
        flagLinkH24
      ]);
}

CountrieStruct createCountrieStruct({
  String? iso2,
  String? enName,
  String? ruName,
  String? flagLink16x12,
  String? flagLink32x24,
  String? flagLink48x36,
  String? flagLinkH24,
}) =>
    CountrieStruct(
      iso2: iso2,
      enName: enName,
      ruName: ruName,
      flagLink16x12: flagLink16x12,
      flagLink32x24: flagLink32x24,
      flagLink48x36: flagLink48x36,
      flagLinkH24: flagLinkH24,
    );
