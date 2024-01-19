import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/authplayerteam_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'teams_widget.dart' show TeamsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamsModel extends FlutterFlowModel<TeamsWidget> {
  ///  Local state fields for this page.

  bool teamActionsVISIBILITY = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (MATCHbyTORNandROUNDandPAIR)] action in Button widget.
  ApiCallResponse? nextmatch;
  // Model for AUTHPLAYERTEAM component.
  late AuthplayerteamModel authplayerteamModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    authplayerteamModel = createModel(context, () => AuthplayerteamModel());
  }

  void dispose() {
    unfocusNode.dispose();
    authplayerteamModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
