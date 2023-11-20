// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<CountrieStruct>?> dtCOUNTRIE(List<dynamic>? jsonArray) async {
  // Add your function code here!
  List<CountrieStruct> listOfStruct = [];
  for (var item in jsonArray!) {
    listOfStruct.add(CountrieStruct.fromMap(item));
  }
  return listOfStruct;
}
