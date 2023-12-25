import '/components/grid_round/grid_round_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'test2_widget.dart' show Test2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Test2Model extends FlutterFlowModel<Test2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for GRID-ROUND component.
  late GridRoundModel gridRoundModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    gridRoundModel = createModel(context, () => GridRoundModel());
  }

  void dispose() {
    unfocusNode.dispose();
    gridRoundModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
