import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/matchreport_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/components/tournament_info_tabs/tournament_info_tabs_widget.dart';
import '/components/tournament_view_members_widget.dart';
import '/components/tournamentgrid_widget.dart';
import '/components/tournamentvieworganizators_widget.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'tournament_view2_widget.dart' show TournamentView2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TournamentView2Model extends FlutterFlowModel<TournamentView2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for VlistITEM component.
  late VlistITEMModel vlistITEMModel;
  // Model for tournamentInfoTabs component.
  late TournamentInfoTabsModel tournamentInfoTabsModel;
  // Model for TOURNAMENTVIEWORGANIZATORS component.
  late TournamentvieworganizatorsModel tournamentvieworganizatorsModel;
  // Stores action output result for [Backend Call - API (TOURNAMENTMEMBERS)] action in Button widget.
  ApiCallResponse? apiResultzr9;
  // Stores action output result for [Backend Call - Update Row] action in Button widget.
  List<TournamentsRow>? apiResultaev;
  // Model for TOURNAMENTGRID component.
  late TournamentgridModel tournamentgridModel;
  // Model for TOURNAMENT-VIEW-MEMBERS component.
  late TournamentViewMembersModel tournamentViewMembersModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vlistITEMModel = createModel(context, () => VlistITEMModel());
    tournamentInfoTabsModel =
        createModel(context, () => TournamentInfoTabsModel());
    tournamentvieworganizatorsModel =
        createModel(context, () => TournamentvieworganizatorsModel());
    tournamentgridModel = createModel(context, () => TournamentgridModel());
    tournamentViewMembersModel =
        createModel(context, () => TournamentViewMembersModel());
  }

  void dispose() {
    unfocusNode.dispose();
    vlistITEMModel.dispose();
    tournamentInfoTabsModel.dispose();
    tournamentvieworganizatorsModel.dispose();
    tournamentgridModel.dispose();
    tournamentViewMembersModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
