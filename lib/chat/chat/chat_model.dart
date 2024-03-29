import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_widget.dart' show ChatWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  List<String> authUserUIDasArray = [];
  void addToAuthUserUIDasArray(String item) => authUserUIDasArray.add(item);
  void removeFromAuthUserUIDasArray(String item) =>
      authUserUIDasArray.remove(item);
  void removeAtIndexFromAuthUserUIDasArray(int index) =>
      authUserUIDasArray.removeAt(index);
  void insertAtIndexInAuthUserUIDasArray(int index, String item) =>
      authUserUIDasArray.insert(index, item);
  void updateAuthUserUIDasArrayAtIndex(int index, Function(String) updateFn) =>
      authUserUIDasArray[index] = updateFn(authUserUIDasArray[index]);

  int unreadedMessagesCount = 0;

  int? loopActionCount = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer2;
  Completer<List<MessageRow>>? requestCompleter2;
  Completer<List<MessageRow>>? requestCompleter1;
  Completer<List<PlayersRow>>? requestCompleter3;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for MESSAGES widget.
  ScrollController? messages;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    messages = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer2?.cancel();
    columnController?.dispose();
    messages?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
