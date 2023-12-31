import '/backend/supabase/supabase.dart';
import '/components/filed_country_edite_widget.dart';
import '/components/filededite_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'teamediteheader_widget.dart' show TeamediteheaderWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamediteheaderModel extends FlutterFlowModel<TeamediteheaderWidget> {
  ///  Local state fields for this component.

  String tag = '';

  String name = '';

  String country = '';

  String flag = 'false';

  String logo = 'false';

  bool fieldVISIBILITY = true;

  bool editeboxVISIBILITY = false;

  bool editeButtonVISIBILITY = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for FIELD-TAG widget.
  FocusNode? fieldTagFocusNode;
  TextEditingController? fieldTagController;
  String? Function(BuildContext, String?)? fieldTagControllerValidator;
  // Stores action output result for [Backend Call - Update Row] action in Button widget.
  List<TeamsRow>? apiResulti3p;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    fieldTagFocusNode?.dispose();
    fieldTagController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
