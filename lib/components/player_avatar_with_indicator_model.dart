import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'player_avatar_with_indicator_widget.dart'
    show PlayerAvatarWithIndicatorWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerAvatarWithIndicatorModel
    extends FlutterFlowModel<PlayerAvatarWithIndicatorWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  Completer<List<PlayersRow>>? requestCompleter;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
