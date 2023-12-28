import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/t_o_u_r_n_a_m_e_n_tgrid_r_o_u_n_d/t_o_u_r_n_a_m_e_n_tgrid_r_o_u_n_d_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'tournament_view_widget.dart' show TournamentViewWidget;
import 'package:cached_network_image/cached_network_image.dart';
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

  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel1;
  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel2;
  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel3;
  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel4;
  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel5;
  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel6;
  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel7;
  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel8;
  // Model for TOURNAMENTgridROUND component.
  late TOURNAMENTgridROUNDModel tOURNAMENTgridROUNDModel9;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tOURNAMENTgridROUNDModel1 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
    tOURNAMENTgridROUNDModel2 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
    tOURNAMENTgridROUNDModel3 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
    tOURNAMENTgridROUNDModel4 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
    tOURNAMENTgridROUNDModel5 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
    tOURNAMENTgridROUNDModel6 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
    tOURNAMENTgridROUNDModel7 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
    tOURNAMENTgridROUNDModel8 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
    tOURNAMENTgridROUNDModel9 =
        createModel(context, () => TOURNAMENTgridROUNDModel());
  }

  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    tOURNAMENTgridROUNDModel1.dispose();
    tOURNAMENTgridROUNDModel2.dispose();
    tOURNAMENTgridROUNDModel3.dispose();
    tOURNAMENTgridROUNDModel4.dispose();
    tOURNAMENTgridROUNDModel5.dispose();
    tOURNAMENTgridROUNDModel6.dispose();
    tOURNAMENTgridROUNDModel7.dispose();
    tOURNAMENTgridROUNDModel8.dispose();
    tOURNAMENTgridROUNDModel9.dispose();
    expandableController4.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
