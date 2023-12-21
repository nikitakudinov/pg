import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'team_view_widget.dart' show TeamViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamViewModel extends FlutterFlowModel<TeamViewWidget> {
  ///  Local state fields for this page.

  List<TeamStruct> curentTeamDATA = [];
  void addToCurentTeamDATA(TeamStruct item) => curentTeamDATA.add(item);
  void removeFromCurentTeamDATA(TeamStruct item) => curentTeamDATA.remove(item);
  void removeAtIndexFromCurentTeamDATA(int index) =>
      curentTeamDATA.removeAt(index);
  void insertAtIndexInCurentTeamDATA(int index, TeamStruct item) =>
      curentTeamDATA.insert(index, item);
  void updateCurentTeamDATAAtIndex(int index, Function(TeamStruct) updateFn) =>
      curentTeamDATA[index] = updateFn(curentTeamDATA[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (LISTTEAMBYID)] action in TEAM_VIEW widget.
  ApiCallResponse? jsonTEAMdata;
  // Stores action output result for [Custom Action - dtTEAM] action in TEAM_VIEW widget.
  List<TeamStruct>? dtTEAMdate;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
