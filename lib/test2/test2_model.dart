import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/grid_round/grid_round_widget.dart';
import '/components/loadingindicator_widget.dart';
import '/components/matchreport_widget.dart';
import '/components/screenshots_in_notification_widget.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'test2_widget.dart' show Test2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Test2Model extends FlutterFlowModel<Test2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for VlistITEM component.
  late VlistITEMModel vlistITEMModel;
  // Model for GRID-ROUND component.
  late GridRoundModel gridRoundModel1;
  // Model for GRID-ROUND component.
  late GridRoundModel gridRoundModel2;
  // Model for GRID-ROUND component.
  late GridRoundModel gridRoundModel3;
  // Model for GRID-ROUND component.
  late GridRoundModel gridRoundModel4;
  // Model for GRID-ROUND component.
  late GridRoundModel gridRoundModel5;
  // Model for GRID-ROUND component.
  late GridRoundModel gridRoundModel6;
  // Model for GRID-ROUND component.
  late GridRoundModel gridRoundModel7;
  // Model for GRID-ROUND component.
  late GridRoundModel gridRoundModel8;
  // Model for GRID-ROUND component.
  late GridRoundModel gridRoundModel9;
  // Model for LOADINGINDICATOR component.
  late LoadingindicatorModel loadingindicatorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vlistITEMModel = createModel(context, () => VlistITEMModel());
    gridRoundModel1 = createModel(context, () => GridRoundModel());
    gridRoundModel2 = createModel(context, () => GridRoundModel());
    gridRoundModel3 = createModel(context, () => GridRoundModel());
    gridRoundModel4 = createModel(context, () => GridRoundModel());
    gridRoundModel5 = createModel(context, () => GridRoundModel());
    gridRoundModel6 = createModel(context, () => GridRoundModel());
    gridRoundModel7 = createModel(context, () => GridRoundModel());
    gridRoundModel8 = createModel(context, () => GridRoundModel());
    gridRoundModel9 = createModel(context, () => GridRoundModel());
    loadingindicatorModel = createModel(context, () => LoadingindicatorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    vlistITEMModel.dispose();
    gridRoundModel1.dispose();
    gridRoundModel2.dispose();
    gridRoundModel3.dispose();
    gridRoundModel4.dispose();
    gridRoundModel5.dispose();
    gridRoundModel6.dispose();
    gridRoundModel7.dispose();
    gridRoundModel8.dispose();
    gridRoundModel9.dispose();
    loadingindicatorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
