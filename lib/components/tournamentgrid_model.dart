import '/components/grid_round/grid_round_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tournamentgrid_widget.dart' show TournamentgridWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TournamentgridModel extends FlutterFlowModel<TournamentgridWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    gridRoundModel1 = createModel(context, () => GridRoundModel());
    gridRoundModel2 = createModel(context, () => GridRoundModel());
    gridRoundModel3 = createModel(context, () => GridRoundModel());
    gridRoundModel4 = createModel(context, () => GridRoundModel());
    gridRoundModel5 = createModel(context, () => GridRoundModel());
    gridRoundModel6 = createModel(context, () => GridRoundModel());
    gridRoundModel7 = createModel(context, () => GridRoundModel());
    gridRoundModel8 = createModel(context, () => GridRoundModel());
    gridRoundModel9 = createModel(context, () => GridRoundModel());
  }

  void dispose() {
    expandableController.dispose();
    gridRoundModel1.dispose();
    gridRoundModel2.dispose();
    gridRoundModel3.dispose();
    gridRoundModel4.dispose();
    gridRoundModel5.dispose();
    gridRoundModel6.dispose();
    gridRoundModel7.dispose();
    gridRoundModel8.dispose();
    gridRoundModel9.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
