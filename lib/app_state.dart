import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _selectedTeamId = 0;
  int get selectedTeamId => _selectedTeamId;
  set selectedTeamId(int _value) {
    _selectedTeamId = _value;
  }

  MaindataStruct _MAINDATA = MaindataStruct();
  MaindataStruct get MAINDATA => _MAINDATA;
  set MAINDATA(MaindataStruct _value) {
    _MAINDATA = _value;
  }

  void updateMAINDATAStruct(Function(MaindataStruct) updateFn) {
    updateFn(_MAINDATA);
  }

  CountersStruct _COUNTERS = CountersStruct();
  CountersStruct get COUNTERS => _COUNTERS;
  set COUNTERS(CountersStruct _value) {
    _COUNTERS = _value;
  }

  void updateCOUNTERSStruct(Function(CountersStruct) updateFn) {
    updateFn(_COUNTERS);
  }

  VisibilityStruct _VISIBILITY = VisibilityStruct();
  VisibilityStruct get VISIBILITY => _VISIBILITY;
  set VISIBILITY(VisibilityStruct _value) {
    _VISIBILITY = _value;
  }

  void updateVISIBILITYStruct(Function(VisibilityStruct) updateFn) {
    updateFn(_VISIBILITY);
  }

  PlayerStruct _AUTHPLAYER = PlayerStruct();
  PlayerStruct get AUTHPLAYER => _AUTHPLAYER;
  set AUTHPLAYER(PlayerStruct _value) {
    _AUTHPLAYER = _value;
  }

  void updateAUTHPLAYERStruct(Function(PlayerStruct) updateFn) {
    updateFn(_AUTHPLAYER);
  }

  TeamStruct _AUTHPLAYERTEAM = TeamStruct();
  TeamStruct get AUTHPLAYERTEAM => _AUTHPLAYERTEAM;
  set AUTHPLAYERTEAM(TeamStruct _value) {
    _AUTHPLAYERTEAM = _value;
  }

  void updateAUTHPLAYERTEAMStruct(Function(TeamStruct) updateFn) {
    updateFn(_AUTHPLAYERTEAM);
  }

  List<String> _STRINGARRAY = [];
  List<String> get STRINGARRAY => _STRINGARRAY;
  set STRINGARRAY(List<String> _value) {
    _STRINGARRAY = _value;
  }

  void addToSTRINGARRAY(String _value) {
    _STRINGARRAY.add(_value);
  }

  void removeFromSTRINGARRAY(String _value) {
    _STRINGARRAY.remove(_value);
  }

  void removeAtIndexFromSTRINGARRAY(int _index) {
    _STRINGARRAY.removeAt(_index);
  }

  void updateSTRINGARRAYAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _STRINGARRAY[_index] = updateFn(_STRINGARRAY[_index]);
  }

  void insertAtIndexInSTRINGARRAY(int _index, String _value) {
    _STRINGARRAY.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
