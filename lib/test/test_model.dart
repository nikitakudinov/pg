import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/loadingindicator_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Model for LOADINGINDICATOR component.
  late LoadingindicatorModel loadingindicatorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingindicatorModel = createModel(context, () => LoadingindicatorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    loadingindicatorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
