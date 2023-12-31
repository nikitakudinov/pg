import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/filed_country_edite_widget.dart';
import '/components/filededite_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'teamediteheader_widget.dart' show TeamediteheaderWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
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

  bool tagediteboxVISIBILITY = false;

  bool nameediteboxVISIBILITY = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for FIELD-TAG widget.
  FocusNode? fieldTagFocusNode;
  TextEditingController? fieldTagController;
  String? Function(BuildContext, String?)? fieldTagControllerValidator;
  // Stores action output result for [Backend Call - Update Row] action in Button widget.
  List<TeamsRow>? updateTag;
  // State field(s) for FIELD-NAME widget.
  FocusNode? fieldNameFocusNode;
  TextEditingController? fieldNameController;
  String? Function(BuildContext, String?)? fieldNameControllerValidator;
  // Stores action output result for [Backend Call - Update Row] action in Button widget.
  List<TeamsRow>? updateName;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    fieldTagFocusNode?.dispose();
    fieldTagController?.dispose();

    fieldNameFocusNode?.dispose();
    fieldNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
