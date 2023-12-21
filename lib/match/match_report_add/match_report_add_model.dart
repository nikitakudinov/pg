import '/backend/schema/structs/index.dart';
import '/components/date_picker_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'match_report_add_widget.dart' show MatchReportAddWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MatchReportAddModel extends FlutterFlowModel<MatchReportAddWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for RIVAL1-WINS widget.
  FocusNode? rival1WinsFocusNode1;
  TextEditingController? rival1WinsController1;
  String? Function(BuildContext, String?)? rival1WinsController1Validator;
  // State field(s) for RIVAL1-WINS widget.
  FocusNode? rival1WinsFocusNode2;
  TextEditingController? rival1WinsController2;
  String? Function(BuildContext, String?)? rival1WinsController2Validator;
  // State field(s) for RIVAL2-WINS widget.
  FocusNode? rival2WinsFocusNode;
  TextEditingController? rival2WinsController;
  String? Function(BuildContext, String?)? rival2WinsControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    rival1WinsFocusNode1?.dispose();
    rival1WinsController1?.dispose();

    rival1WinsFocusNode2?.dispose();
    rival1WinsController2?.dispose();

    rival2WinsFocusNode?.dispose();
    rival2WinsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
