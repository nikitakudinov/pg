import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/rating_teams_tabs_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<String> chatMembers = [];
  void addToChatMembers(String item) => chatMembers.add(item);
  void removeFromChatMembers(String item) => chatMembers.remove(item);
  void removeAtIndexFromChatMembers(int index) => chatMembers.removeAt(index);
  void insertAtIndexInChatMembers(int index, String item) =>
      chatMembers.insert(index, item);
  void updateChatMembersAtIndex(int index, Function(String) updateFn) =>
      chatMembers[index] = updateFn(chatMembers[index]);

  List<PlayerUidStruct> playerUID = [];
  void addToPlayerUID(PlayerUidStruct item) => playerUID.add(item);
  void removeFromPlayerUID(PlayerUidStruct item) => playerUID.remove(item);
  void removeAtIndexFromPlayerUID(int index) => playerUID.removeAt(index);
  void insertAtIndexInPlayerUID(int index, PlayerUidStruct item) =>
      playerUID.insert(index, item);
  void updatePlayerUIDAtIndex(int index, Function(PlayerUidStruct) updateFn) =>
      playerUID[index] = updateFn(playerUID[index]);

  int? test;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (UPDATEDTEAMScount)] action in Icon widget.
  ApiCallResponse? jsonNEWMATCHEScount;
  // Stores action output result for [Backend Call - API (UPDATEDTEAMS)] action in Icon widget.
  ApiCallResponse? apiResult7s1;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P1;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P2;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P3;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P4;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P5;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P6;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P7;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P8;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P9;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P10;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P11;
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? jsonR1P12;
  // Model for ratingTeamsTabs component.
  late RatingTeamsTabsModel ratingTeamsTabsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    ratingTeamsTabsModel = createModel(context, () => RatingTeamsTabsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    ratingTeamsTabsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
