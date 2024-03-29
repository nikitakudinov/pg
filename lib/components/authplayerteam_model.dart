import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/loadingindicator_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'authplayerteam_widget.dart' show AuthplayerteamWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthplayerteamModel extends FlutterFlowModel<AuthplayerteamWidget> {
  ///  Local state fields for this component.

  bool teamActionslistVISIBILITY = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GETCHATBYID)] action in Button widget.
  ApiCallResponse? jsonTEAMCHAT;
  // Model for LOADINGINDICATOR component.
  late LoadingindicatorModel loadingindicatorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingindicatorModel = createModel(context, () => LoadingindicatorModel());
  }

  void dispose() {
    loadingindicatorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
