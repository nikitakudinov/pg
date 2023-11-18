import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/country_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'tournament_add_widget.dart' show TournamentAddWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TournamentAddModel extends FlutterFlowModel<TournamentAddWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for tournamentName widget.
  FocusNode? tournamentNameFocusNode;
  TextEditingController? tournamentNameController;
  String? Function(BuildContext, String?)? tournamentNameControllerValidator;
  // State field(s) for tournamentTag widget.
  FocusNode? tournamentTagFocusNode;
  TextEditingController? tournamentTagController;
  String? Function(BuildContext, String?)? tournamentTagControllerValidator;
  // Model for countryPicker component.
  late CountryPickerModel countryPickerModel;
  // Stores action output result for [Backend Call - API (LISTUSERBYUID)] action in saveButton widget.
  ApiCallResponse? ass;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    countryPickerModel = createModel(context, () => CountryPickerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tournamentNameFocusNode?.dispose();
    tournamentNameController?.dispose();

    tournamentTagFocusNode?.dispose();
    tournamentTagController?.dispose();

    countryPickerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
