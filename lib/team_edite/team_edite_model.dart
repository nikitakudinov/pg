import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/country_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'team_edite_widget.dart' show TeamEditeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamEditeModel extends FlutterFlowModel<TeamEditeWidget> {
  ///  Local state fields for this page.

  String logo = 'false';

  String name = '';

  String tag = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (LISTTEAMBYUID)] action in TEAM_EDITE widget.
  ApiCallResponse? apiResultsn8;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for teamName widget.
  FocusNode? teamNameFocusNode;
  TextEditingController? teamNameController;
  String? Function(BuildContext, String?)? teamNameControllerValidator;
  // State field(s) for teamTag widget.
  FocusNode? teamTagFocusNode;
  TextEditingController? teamTagController;
  String? Function(BuildContext, String?)? teamTagControllerValidator;
  // Model for countryPicker component.
  late CountryPickerModel countryPickerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    countryPickerModel = createModel(context, () => CountryPickerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    teamNameFocusNode?.dispose();
    teamNameController?.dispose();

    teamTagFocusNode?.dispose();
    teamTagController?.dispose();

    countryPickerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
