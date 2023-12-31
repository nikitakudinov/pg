import '/backend/schema/structs/index.dart';
import '/components/team_members_widget.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editeteammembers_widget.dart' show EditeteammembersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditeteammembersModel extends FlutterFlowModel<EditeteammembersWidget> {
  ///  Local state fields for this component.

  bool callMemberVISIBILITY = false;

  ///  State fields for stateful widgets in this component.

  // Model for CALL-MEMBER.
  late TeamMembersModel callMemberModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    callMemberModel = createModel(context, () => TeamMembersModel());
  }

  void dispose() {
    callMemberModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
