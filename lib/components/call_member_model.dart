import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'call_member_widget.dart' show CallMemberWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CallMemberModel extends FlutterFlowModel<CallMemberWidget> {
  ///  Local state fields for this component.

  PlayerStruct? player;
  void updatePlayerStruct(Function(PlayerStruct) updateFn) =>
      updateFn(player ??= PlayerStruct());

  bool messagetextVISIBILITY = false;

  bool playerdataVISIBILITY = false;

  bool searchVISIBILITY = true;

  bool buttonsVISIBILITY = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (LISTPLAYERBYID)] action in Button widget.
  ApiCallResponse? apiResultxwd;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  NotificationsRow? addNotification1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
