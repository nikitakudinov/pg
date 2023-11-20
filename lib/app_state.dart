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

  UserStruct _authenticateduser = UserStruct();
  UserStruct get authenticateduser => _authenticateduser;
  set authenticateduser(UserStruct _value) {
    _authenticateduser = _value;
  }

  void updateAuthenticateduserStruct(Function(UserStruct) updateFn) {
    updateFn(_authenticateduser);
  }

  List<TeamStruct> _allTEAMS = [];
  List<TeamStruct> get allTEAMS => _allTEAMS;
  set allTEAMS(List<TeamStruct> _value) {
    _allTEAMS = _value;
  }

  void addToAllTEAMS(TeamStruct _value) {
    _allTEAMS.add(_value);
  }

  void removeFromAllTEAMS(TeamStruct _value) {
    _allTEAMS.remove(_value);
  }

  void removeAtIndexFromAllTEAMS(int _index) {
    _allTEAMS.removeAt(_index);
  }

  void updateAllTEAMSAtIndex(
    int _index,
    TeamStruct Function(TeamStruct) updateFn,
  ) {
    _allTEAMS[_index] = updateFn(_allTEAMS[_index]);
  }

  void insertAtIndexInAllTEAMS(int _index, TeamStruct _value) {
    _allTEAMS.insert(_index, _value);
  }

  List<CountrieStruct> _allCountries = [];
  List<CountrieStruct> get allCountries => _allCountries;
  set allCountries(List<CountrieStruct> _value) {
    _allCountries = _value;
  }

  void addToAllCountries(CountrieStruct _value) {
    _allCountries.add(_value);
  }

  void removeFromAllCountries(CountrieStruct _value) {
    _allCountries.remove(_value);
  }

  void removeAtIndexFromAllCountries(int _index) {
    _allCountries.removeAt(_index);
  }

  void updateAllCountriesAtIndex(
    int _index,
    CountrieStruct Function(CountrieStruct) updateFn,
  ) {
    _allCountries[_index] = updateFn(_allCountries[_index]);
  }

  void insertAtIndexInAllCountries(int _index, CountrieStruct _value) {
    _allCountries.insert(_index, _value);
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
