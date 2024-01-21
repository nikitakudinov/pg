import '/backend/schema/structs/index.dart';
import '/components/editeteammembers_widget.dart';
import '/components/teamediteheader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'team_edite_widget.dart' show TeamEditeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamEditeModel extends FlutterFlowModel<TeamEditeWidget> {
  ///  Local state fields for this page.

  String logo = 'false';

  String name = '';

  String tag = '';

  bool messageConfirmInvintVISIBILITY = false;

  bool searchPlaerByIdVISIBILITY = false;

  List<String> chatMembers = [];
  void addToChatMembers(String item) => chatMembers.add(item);
  void removeFromChatMembers(String item) => chatMembers.remove(item);
  void removeAtIndexFromChatMembers(int index) => chatMembers.removeAt(index);
  void insertAtIndexInChatMembers(int index, String item) =>
      chatMembers.insert(index, item);
  void updateChatMembersAtIndex(int index, Function(String) updateFn) =>
      chatMembers[index] = updateFn(chatMembers[index]);

  List<PlayerStruct> teamMembersList = [];
  void addToTeamMembersList(PlayerStruct item) => teamMembersList.add(item);
  void removeFromTeamMembersList(PlayerStruct item) =>
      teamMembersList.remove(item);
  void removeAtIndexFromTeamMembersList(int index) =>
      teamMembersList.removeAt(index);
  void insertAtIndexInTeamMembersList(int index, PlayerStruct item) =>
      teamMembersList.insert(index, item);
  void updateTeamMembersListAtIndex(
          int index, Function(PlayerStruct) updateFn) =>
      teamMembersList[index] = updateFn(teamMembersList[index]);

  TeamStruct? curentTeamData;
  void updateCurentTeamDataStruct(Function(TeamStruct) updateFn) =>
      updateFn(curentTeamData ??= TeamStruct());

  List<PlayerStruct> searchedPlayer = [];
  void addToSearchedPlayer(PlayerStruct item) => searchedPlayer.add(item);
  void removeFromSearchedPlayer(PlayerStruct item) =>
      searchedPlayer.remove(item);
  void removeAtIndexFromSearchedPlayer(int index) =>
      searchedPlayer.removeAt(index);
  void insertAtIndexInSearchedPlayer(int index, PlayerStruct item) =>
      searchedPlayer.insert(index, item);
  void updateSearchedPlayerAtIndex(
          int index, Function(PlayerStruct) updateFn) =>
      searchedPlayer[index] = updateFn(searchedPlayer[index]);

  TeamStruct? teamData;
  void updateTeamDataStruct(Function(TeamStruct) updateFn) =>
      updateFn(teamData ??= TeamStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Model for TEAMEDITEHEADER component.
  late TeamediteheaderModel teamediteheaderModel;
  // Model for EDITETEAMMEMBERS component.
  late EditeteammembersModel editeteammembersModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    teamediteheaderModel = createModel(context, () => TeamediteheaderModel());
    editeteammembersModel = createModel(context, () => EditeteammembersModel());
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    teamediteheaderModel.dispose();
    editeteammembersModel.dispose();
  }

  /// Action blocks are added here.

  Future dowloadTeamMembersToPageState(
    BuildContext context, {
    int? teamId,
  }) async {}

  Future dowloadCurentTeamDataToPageState(
    BuildContext context, {
    required int? teamId,
  }) async {}

  Future updateInitPageStateValues(BuildContext context) async {}

  /// Additional helper methods are added here.
}
