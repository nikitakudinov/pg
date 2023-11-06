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

  List<ChatmemberStruct> _chatmembes = [];
  List<ChatmemberStruct> get chatmembes => _chatmembes;
  set chatmembes(List<ChatmemberStruct> _value) {
    _chatmembes = _value;
  }

  void addToChatmembes(ChatmemberStruct _value) {
    _chatmembes.add(_value);
  }

  void removeFromChatmembes(ChatmemberStruct _value) {
    _chatmembes.remove(_value);
  }

  void removeAtIndexFromChatmembes(int _index) {
    _chatmembes.removeAt(_index);
  }

  void updateChatmembesAtIndex(
    int _index,
    ChatmemberStruct Function(ChatmemberStruct) updateFn,
  ) {
    _chatmembes[_index] = updateFn(_chatmembes[_index]);
  }

  void insertAtIndexInChatmembes(int _index, ChatmemberStruct _value) {
    _chatmembes.insert(_index, _value);
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
