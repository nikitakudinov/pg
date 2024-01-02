import '/components/player_view_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'player_view_widget.dart' show PlayerViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerViewModel extends FlutterFlowModel<PlayerViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PLAYER-VIEW-HEADER component.
  late PlayerViewHeaderModel playerViewHeaderModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    playerViewHeaderModel = createModel(context, () => PlayerViewHeaderModel());
  }

  void dispose() {
    unfocusNode.dispose();
    playerViewHeaderModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
