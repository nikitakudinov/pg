import '/components/grid_round/grid_round_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tournamentgrid_model.dart';
export 'tournamentgrid_model.dart';

class TournamentgridWidget extends StatefulWidget {
  const TournamentgridWidget({
    Key? key,
    String? title,
    required this.tournamentId,
  })  : this.title = title ?? '0',
        super(key: key);

  final String title;
  final int? tournamentId;

  @override
  _TournamentgridWidgetState createState() => _TournamentgridWidgetState();
}

class _TournamentgridWidgetState extends State<TournamentgridWidget> {
  late TournamentgridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TournamentgridModel());

    _model.expandableController = ExpandableController(initialExpanded: false);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      color: Color(0x00000000),
      child: ExpandableNotifier(
        controller: _model.expandableController,
        child: ExpandablePanel(
          header: Text(
            widget.title,
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          collapsed: Container(),
          expanded: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.gridRoundModel1,
                    updateCallback: () => setState(() {}),
                    child: GridRoundWidget(
                      round: 1,
                      iteamspacing: 5,
                      paddingtop: 5,
                      itemheight: 110,
                      pairFrom: 0,
                      pairTo: 8,
                      tournamentId: widget.tournamentId!,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.gridRoundModel2,
                        updateCallback: () => setState(() {}),
                        child: GridRoundWidget(
                          round: 2,
                          iteamspacing: 120,
                          paddingtop: 5,
                          itemheight: 110,
                          pairFrom: 0,
                          pairTo: 4,
                          tournamentId: widget.tournamentId!,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 175.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.gridRoundModel3,
                      updateCallback: () => setState(() {}),
                      child: GridRoundWidget(
                        round: 3,
                        iteamspacing: 350,
                        paddingtop: 5,
                        itemheight: 110,
                        pairFrom: 0,
                        pairTo: 2,
                        tournamentId: widget.tournamentId!,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 405.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.gridRoundModel4,
                      updateCallback: () => setState(() {}),
                      child: GridRoundWidget(
                        round: 4,
                        iteamspacing: 110,
                        paddingtop: 5,
                        itemheight: 110,
                        pairFrom: 1,
                        pairTo: 1,
                        tournamentId: widget.tournamentId!,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 350.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.gridRoundModel5,
                      updateCallback: () => setState(() {}),
                      child: GridRoundWidget(
                        round: 5,
                        iteamspacing: 5,
                        paddingtop: 5,
                        itemheight: 110,
                        pairFrom: 0,
                        pairTo: 2,
                        tournamentId: widget.tournamentId!,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 405.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.gridRoundModel6,
                      updateCallback: () => setState(() {}),
                      child: GridRoundWidget(
                        round: 4,
                        iteamspacing: 110,
                        paddingtop: 5,
                        itemheight: 110,
                        pairFrom: 2,
                        pairTo: 2,
                        tournamentId: widget.tournamentId!,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 175.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.gridRoundModel7,
                      updateCallback: () => setState(() {}),
                      child: GridRoundWidget(
                        round: 3,
                        iteamspacing: 350,
                        paddingtop: 5,
                        itemheight: 110,
                        pairFrom: 3,
                        pairTo: 4,
                        tournamentId: widget.tournamentId!,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.gridRoundModel8,
                        updateCallback: () => setState(() {}),
                        child: GridRoundWidget(
                          round: 2,
                          iteamspacing: 120,
                          paddingtop: 5,
                          itemheight: 110,
                          pairFrom: 5,
                          pairTo: 8,
                          tournamentId: widget.tournamentId!,
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.gridRoundModel9,
                    updateCallback: () => setState(() {}),
                    child: GridRoundWidget(
                      round: 1,
                      iteamspacing: 5,
                      paddingtop: 5,
                      itemheight: 110,
                      pairFrom: 9,
                      pairTo: 16,
                      tournamentId: widget.tournamentId!,
                    ),
                  ),
                ],
              ),
            ),
          ),
          theme: ExpandableThemeData(
            tapHeaderToExpand: true,
            tapBodyToExpand: false,
            tapBodyToCollapse: false,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            hasIcon: false,
          ),
        ),
      ),
    );
  }
}
