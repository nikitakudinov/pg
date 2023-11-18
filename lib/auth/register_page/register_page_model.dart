import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/country_picker_widget.dart';
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
  // State field(s) for nickname widget.
  FocusNode? nicknameFocusNode;
  TextEditingController? nicknameController;
  String? Function(BuildContext, String?)? nicknameControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for repassword widget.
  FocusNode? repasswordFocusNode;
  TextEditingController? repasswordController;
  late bool repasswordVisibility;
  String? Function(BuildContext, String?)? repasswordControllerValidator;
  // Model for countryPicker component.
  late CountryPickerModel countryPickerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    repasswordVisibility = false;
    countryPickerModel = createModel(context, () => CountryPickerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    nicknameFocusNode?.dispose();
    nicknameController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    repasswordFocusNode?.dispose();
    repasswordController?.dispose();

    countryPickerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
