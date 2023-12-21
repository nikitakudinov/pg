import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/country_picker/country_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'team_add_widget.dart' show TeamAddWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamAddModel extends FlutterFlowModel<TeamAddWidget> {
  ///  Local state fields for this page.

  List<String> chatMembers = [];
  void addToChatMembers(String item) => chatMembers.add(item);
  void removeFromChatMembers(String item) => chatMembers.remove(item);
  void removeAtIndexFromChatMembers(int index) => chatMembers.removeAt(index);
  void insertAtIndexInChatMembers(int index, String item) =>
      chatMembers.insert(index, item);
  void updateChatMembersAtIndex(int index, Function(String) updateFn) =>
      chatMembers[index] = updateFn(chatMembers[index]);

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
  // Stores action output result for [Backend Call - API (TEAMBYCREATOR)] action in saveButton widget.
  ApiCallResponse? createdteam;
  // Stores action output result for [Backend Call - API (CHATBYTEAMID)] action in saveButton widget.
  ApiCallResponse? createdchat;

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
