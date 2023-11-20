import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (LISTPLAYERBYUID)] action in HomePage widget.
  ApiCallResponse? apiResultqcj;
  // Stores action output result for [Backend Call - API (LISTTEAMBYID)] action in HomePage widget.
  ApiCallResponse? teambyid;
  // Stores action output result for [Backend Call - API (CHATBYTEAMID)] action in Button widget.
  ApiCallResponse? chatByTeamId;
  // Stores action output result for [Backend Call - API (LISTPLAYERBYUID)] action in Button widget.
  ApiCallResponse? userByYathUID;
  // Stores action output result for [Backend Call - API (LISTTEAMBYID)] action in Button widget.
  ApiCallResponse? fromTeamInfo;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
