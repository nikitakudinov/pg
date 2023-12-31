import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/country_picker/country_picker_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'tournament_add_widget.dart' show TournamentAddWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TournamentAddModel extends FlutterFlowModel<TournamentAddWidget> {
  ///  Local state fields for this page.

  List<int> members = [];
  void addToMembers(int item) => members.add(item);
  void removeFromMembers(int item) => members.remove(item);
  void removeAtIndexFromMembers(int index) => members.removeAt(index);
  void insertAtIndexInMembers(int index, int item) =>
      members.insert(index, item);
  void updateMembersAtIndex(int index, Function(int) updateFn) =>
      members[index] = updateFn(members[index]);

  List<String> organizators = [];
  void addToOrganizators(String item) => organizators.add(item);
  void removeFromOrganizators(String item) => organizators.remove(item);
  void removeAtIndexFromOrganizators(int index) => organizators.removeAt(index);
  void insertAtIndexInOrganizators(int index, String item) =>
      organizators.insert(index, item);
  void updateOrganizatorsAtIndex(int index, Function(String) updateFn) =>
      organizators[index] = updateFn(organizators[index]);

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
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for countryPicker component.
  late CountryPickerModel countryPickerModel;
  // Stores action output result for [Backend Call - API (TOURNAMENTBYCREATOR)] action in saveButton widget.
  ApiCallResponse? jsonTOURNAMENT;

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
