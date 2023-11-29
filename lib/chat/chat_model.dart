import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
