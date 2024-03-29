import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/country_picker/country_picker_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tournament_edite_widget.dart' show TournamentEditeWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TournamentEditeModel extends FlutterFlowModel<TournamentEditeWidget> {
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

  String tournamentLogo = 'false';

  int? curentLoopCount = 1;

  List<int> tournamentMembersIDs = [];
  void addToTournamentMembersIDs(int item) => tournamentMembersIDs.add(item);
  void removeFromTournamentMembersIDs(int item) =>
      tournamentMembersIDs.remove(item);
  void removeAtIndexFromTournamentMembersIDs(int index) =>
      tournamentMembersIDs.removeAt(index);
  void insertAtIndexInTournamentMembersIDs(int index, int item) =>
      tournamentMembersIDs.insert(index, item);
  void updateTournamentMembersIDsAtIndex(int index, Function(int) updateFn) =>
      tournamentMembersIDs[index] = updateFn(tournamentMembersIDs[index]);

  int? rival1 = 0;

  int? rival2 = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

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
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // Stores action output result for [Backend Call - API (TOURNAMENTMEMBERS)] action in IconButton widget.
  ApiCallResponse? tournamentMember;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    countryPickerModel = createModel(context, () => CountryPickerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    tournamentNameFocusNode?.dispose();
    tournamentNameController?.dispose();

    tournamentTagFocusNode?.dispose();
    tournamentTagController?.dispose();

    countryPickerModel.dispose();
    expandableController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
