import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'register_page_widget.dart' show RegisterPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPageModel extends FlutterFlowModel<RegisterPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode1;
  TextEditingController? passwordController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordController1Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode2;
  TextEditingController? passwordController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode1?.dispose();
    passwordController1?.dispose();

    passwordFocusNode2?.dispose();
    passwordController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
