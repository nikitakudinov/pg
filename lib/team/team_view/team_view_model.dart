import '/backend/schema/structs/index.dart';
import '/components/team_view_header_widget.dart';
import '/components/team_view_members_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'team_view_widget.dart' show TeamViewWidget;
import 'package:flutter/material.dart';
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
  // Model for TEAM-VIEW-HEADER component.
  late TeamViewHeaderModel teamViewHeaderModel;
  // Model for TEAM-VIEW-MEMBERS component.
  late TeamViewMembersModel teamViewMembersModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    teamViewHeaderModel = createModel(context, () => TeamViewHeaderModel());
    teamViewMembersModel = createModel(context, () => TeamViewMembersModel());
  }

  void dispose() {
    unfocusNode.dispose();
    teamViewHeaderModel.dispose();
    teamViewMembersModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
