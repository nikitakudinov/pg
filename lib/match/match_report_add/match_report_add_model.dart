import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
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
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MatchReportAddModel extends FlutterFlowModel<MatchReportAddWidget> {
  ///  Local state fields for this page.

  String screenShot1VALUE = '0';

  String screenShot2VALUE = '0';

  String screenShot3VALUE = '0';

  String screenShot4VALUE = '0';

  String screenShot5VALUE = '0';

  String? screenShot6VALUE = '0';

  String screenShot7VALUE = '0';

  String screenShot8VALUE = '0';

  String screenShot9VALUE = '0';

  String screenShot10VALUE = 'false';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RAUND widget.
  String? raundValue;
  FormFieldController<String>? raundValueController;
  // State field(s) for PAIR widget.
  String? pairValue;
  FormFieldController<String>? pairValueController;
  // State field(s) for RIVAL1-WINS widget.
  FocusNode? rival1WinsFocusNode;
  TextEditingController? rival1WinsController;
  String? Function(BuildContext, String?)? rival1WinsControllerValidator;
  // State field(s) for RIVAL2-WINS widget.
  FocusNode? rival2WinsFocusNode;
  TextEditingController? rival2WinsController;
  String? Function(BuildContext, String?)? rival2WinsControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl5 = '';

  // Stores action output result for [Backend Call - API (TOURNAMENTBYID)] action in Button widget.
  ApiCallResponse? tournamentData;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    rival1WinsFocusNode?.dispose();
    rival1WinsController?.dispose();

    rival2WinsFocusNode?.dispose();
    rival2WinsController?.dispose();

    expandableController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
