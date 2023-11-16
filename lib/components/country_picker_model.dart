import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'country_picker_widget.dart' show CountryPickerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CountryPickerModel extends FlutterFlowModel<CountryPickerWidget> {
  ///  Local state fields for this component.

  String selectedCountry = 'Не выбран';

  String selectedFlag = 'false';

  bool selectedButtonVISIBILITY = true;

  bool countriesListVISIBILITY = false;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
