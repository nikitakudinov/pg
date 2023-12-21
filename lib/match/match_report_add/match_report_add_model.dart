import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'match_report_add_widget.dart' show MatchReportAddWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MatchReportAddModel extends FlutterFlowModel<MatchReportAddWidget> {
  ///  Local state fields for this page.

  String screenShot1VALUE = '0';

  String screenShot2VALUE = '0';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for RIVAL1-WINS widget.
  FocusNode? rival1WinsFocusNode;
  TextEditingController? rival1WinsController;
  String? Function(BuildContext, String?)? rival1WinsControllerValidator;
  // State field(s) for RIVAL2-WINS widget.
  FocusNode? rival2WinsFocusNode;
  TextEditingController? rival2WinsController;
  String? Function(BuildContext, String?)? rival2WinsControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    rival1WinsFocusNode?.dispose();
    rival1WinsController?.dispose();

    rival2WinsFocusNode?.dispose();
    rival2WinsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
