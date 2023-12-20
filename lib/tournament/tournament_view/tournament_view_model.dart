import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/t_o_u_r_n_a_m_e_n_tgrid_r_o_u_n_d_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'tournament_view_widget.dart' show TournamentViewWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TournamentViewModel extends FlutterFlowModel<TournamentViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (TOURNAMENTMATCHES)] action in TOURNAMENT_VIEW widget.
  ApiCallResponse? jsonTOURNAMENTMATCHESdata;
  // Stores action output result for [Custom Action - dtMATCH] action in TOURNAMENT_VIEW widget.
  List<MatchStruct>? dtTOURNAMENTMATCHESdata;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel1;
  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tOURNAMENTgridROUNDModel1 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
    tOURNAMENTgridROUNDModel2 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
  }

  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
    tOURNAMENTgridROUNDModel1.dispose();
    tOURNAMENTgridROUNDModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
