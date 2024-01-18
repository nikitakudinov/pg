import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/country_picker/country_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/backend/schema/structs/index.dart';
import 'teamadd_widget.dart' show TeamaddWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamaddModel extends FlutterFlowModel<TeamaddWidget> {
  ///  Local state fields for this page.

  String teamLogoPath = 'false';

  List<String> chatMembersArray = [''];
  void addToChatMembersArray(String item) => chatMembersArray.add(item);
  void removeFromChatMembersArray(String item) => chatMembersArray.remove(item);
  void removeAtIndexFromChatMembersArray(int index) =>
      chatMembersArray.removeAt(index);
  void insertAtIndexInChatMembersArray(int index, String item) =>
      chatMembersArray.insert(index, item);
  void updateChatMembersArrayAtIndex(int index, Function(String) updateFn) =>
      chatMembersArray[index] = updateFn(chatMembersArray[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  // Stores action output result for [Backend Call - API (TEAMBYCREATOR)] action in Button widget.
  ApiCallResponse? apiResultvmq;
  // Stores action output result for [Backend Call - API (GETCHATBYMEMBERS)] action in Button widget.
  ApiCallResponse? apiResult1qc;

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
