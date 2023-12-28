import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'matchreport_widget.dart' show MatchreportWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MatchreportModel extends FlutterFlowModel<MatchreportWidget> {
  ///  Local state fields for this component.

  int rival1wins = 0;

  int rival2wins = 0;

  String screenshot1 =
      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/com.panzerdog.tacticool-featured.png';

  String screenshot2 =
      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/com.panzerdog.tacticool-featured.png';

  String screenshot3 =
      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/com.panzerdog.tacticool-featured.png';

  String screenshot4 =
      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/com.panzerdog.tacticool-featured.png';

  String screenshot5 =
      'https://supabase.proplayclub.ru/storage/v1/object/public/playground/com.panzerdog.tacticool-featured.png';

  ///  State fields for stateful widgets in this component.

  // State field(s) for RAUND widget.
  String? raundValue;
  FormFieldController<String>? raundValueController;
  // State field(s) for PAIR widget.
  String? pairValue;
  FormFieldController<String>? pairValueController;
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
    expandableController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
