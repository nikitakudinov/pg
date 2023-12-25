import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (LISTPLAYERS)] action in TEST widget.
  ApiCallResponse? jsonPLAYERS;
  // Stores action output result for [Backend Call - API (LISTALLTEAMS)] action in TEST widget.
  ApiCallResponse? jsonTEAMS;
  // Stores action output result for [Backend Call - API (TOURNAMENTS)] action in TEST widget.
  ApiCallResponse? jsonTOURNAMENTS;
  // Stores action output result for [Backend Call - API (MATCHES)] action in TEST widget.
  ApiCallResponse? jsonMATCHES;
  // Stores action output result for [Backend Call - API (COUNTRIES)] action in TEST widget.
  ApiCallResponse? jsonCOUNTRIES;
  // Stores action output result for [Backend Call - API (GETuserNotifications)] action in TEST widget.
  ApiCallResponse? jsonNOTIFICATIONS;
  // Stores action output result for [Backend Call - API (GETUSERCHATS)] action in TEST widget.
  ApiCallResponse? jsonCHATS;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
