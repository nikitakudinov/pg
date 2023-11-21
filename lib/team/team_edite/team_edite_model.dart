import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/country_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'team_edite_widget.dart' show TeamEditeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeamEditeModel extends FlutterFlowModel<TeamEditeWidget> {
  ///  Local state fields for this page.

  String logo = 'false';

  String name = '';

  String tag = '';

  bool messageConfirmInvintVISIBILITY = false;

  bool searchPlaerByIdVISIBILITY = false;

  List<String> chatMembers = [];
  void addToChatMembers(String item) => chatMembers.add(item);
  void removeFromChatMembers(String item) => chatMembers.remove(item);
  void removeAtIndexFromChatMembers(int index) => chatMembers.removeAt(index);
  void insertAtIndexInChatMembers(int index, String item) =>
      chatMembers.insert(index, item);
  void updateChatMembersAtIndex(int index, Function(String) updateFn) =>
      chatMembers[index] = updateFn(chatMembers[index]);

  List<PlayerStruct> teamMembersList = [];
  void addToTeamMembersList(PlayerStruct item) => teamMembersList.add(item);
  void removeFromTeamMembersList(PlayerStruct item) =>
      teamMembersList.remove(item);
  void removeAtIndexFromTeamMembersList(int index) =>
      teamMembersList.removeAt(index);
  void insertAtIndexInTeamMembersList(int index, PlayerStruct item) =>
      teamMembersList.insert(index, item);
  void updateTeamMembersListAtIndex(
          int index, Function(PlayerStruct) updateFn) =>
      teamMembersList[index] = updateFn(teamMembersList[index]);

  TeamStruct? curentTeamData;
  void updateCurentTeamDataStruct(Function(TeamStruct) updateFn) =>
      updateFn(curentTeamData ??= TeamStruct());

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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - API (CHATS)] action in IconButton widget.
  ApiCallResponse? apiResultigb;
  // Stores action output result for [Backend Call - API (CHATS)] action in IconButton widget.
  ApiCallResponse? apiResult8j2;

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
    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  Future dowloadTeamMembersToPageState(
    BuildContext context, {
    int? teamId,
  }) async {
    ApiCallResponse? allMembersOfTeamJson;
    List<PlayerStruct>? converterTeamMembersData;

    allMembersOfTeamJson =
        await PlayerGroup.lISTPLAYERBYTEAMandTEAMROLECall.call(
      playersOfTeam: teamId?.toString(),
    );
    if ((allMembersOfTeamJson?.succeeded ?? true)) {
      converterTeamMembersData = await actions.dtPLAYER(
        (allMembersOfTeamJson?.jsonBody ?? ''),
      );
      teamMembersList = converterTeamMembersData!.toList().cast<PlayerStruct>();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Участники команды загружены',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    }
  }

  Future dowloadCurentTeamDataToPageState(
    BuildContext context, {
    required int? teamId,
  }) async {}

  Future updateInitPageStateValues(BuildContext context) async {
    logo = FFAppState().allTEAMS[widget.teamIndex].teamLogo;
  }

  /// Additional helper methods are added here.
}
