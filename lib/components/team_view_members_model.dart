import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/player_avatar_with_indicator_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'team_view_members_widget.dart' show TeamViewMembersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamViewMembersModel extends FlutterFlowModel<TeamViewMembersWidget> {
  ///  Local state fields for this component.

  List<String> chatMembersArray = [];
  void addToChatMembersArray(String item) => chatMembersArray.add(item);
  void removeFromChatMembersArray(String item) => chatMembersArray.remove(item);
  void removeAtIndexFromChatMembersArray(int index) =>
      chatMembersArray.removeAt(index);
  void insertAtIndexInChatMembersArray(int index, String item) =>
      chatMembersArray.insert(index, item);
  void updateChatMembersArrayAtIndex(int index, Function(String) updateFn) =>
      chatMembersArray[index] = updateFn(chatMembersArray[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GETCHATBYMEMBERScount)] action in MESSAGE widget.
  ApiCallResponse? apiResultr6w;
  // Stores action output result for [Backend Call - API (GETCHATBYMEMBERS)] action in MESSAGE widget.
  ApiCallResponse? apiResultido;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
