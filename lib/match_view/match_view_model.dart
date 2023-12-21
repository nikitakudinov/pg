import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'match_view_widget.dart' show MatchViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MatchViewModel extends FlutterFlowModel<MatchViewWidget> {
  ///  Local state fields for this page.

  List<MatchStruct> curentMatchData = [];
  void addToCurentMatchData(MatchStruct item) => curentMatchData.add(item);
  void removeFromCurentMatchData(MatchStruct item) =>
      curentMatchData.remove(item);
  void removeAtIndexFromCurentMatchData(int index) =>
      curentMatchData.removeAt(index);
  void insertAtIndexInCurentMatchData(int index, MatchStruct item) =>
      curentMatchData.insert(index, item);
  void updateCurentMatchDataAtIndex(
          int index, Function(MatchStruct) updateFn) =>
      curentMatchData[index] = updateFn(curentMatchData[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (MATCHBYID)] action in MATCH_VIEW widget.
  ApiCallResponse? jsonMATCHdata;
  // Stores action output result for [Custom Action - dtMATCH] action in MATCH_VIEW widget.
  List<MatchStruct>? dtMATCHdata;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
