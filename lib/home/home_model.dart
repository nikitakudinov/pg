import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/authplayerteam_widget.dart';
import '/components/loadingindicator_widget.dart';
import '/components/rating_teams_tabs_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Model for AUTHPLAYERTEAM component.
  late AuthplayerteamModel authplayerteamModel;
  // Model for ratingTeamsTabs component.
  late RatingTeamsTabsModel ratingTeamsTabsModel;
  // Stores action output result for [Backend Call - API (GETCHATBYID)] action in Button widget.
  ApiCallResponse? jsonTEAMCHAT;
  // Model for LOADINGINDICATOR component.
  late LoadingindicatorModel loadingindicatorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    authplayerteamModel = createModel(context, () => AuthplayerteamModel());
    ratingTeamsTabsModel = createModel(context, () => RatingTeamsTabsModel());
    loadingindicatorModel = createModel(context, () => LoadingindicatorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    authplayerteamModel.dispose();
    ratingTeamsTabsModel.dispose();
    loadingindicatorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
