import '/components/grid_round/grid_round_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test2_model.dart';
export 'test2_model.dart';

class Test2Widget extends StatefulWidget {
  const Test2Widget({
    Key? key,
    int? tournamentId,
  })  : this.tournamentId = tournamentId ?? 0,
        super(key: key);

  final int tournamentId;

  @override
  _Test2WidgetState createState() => _Test2WidgetState();
}

class _Test2WidgetState extends State<Test2Widget> {
  late Test2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Test2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
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
                              tournamentId: widget.tournamentId,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  165.0, 60.0, 0.0, 0.0),
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
                                  tournamentId: widget.tournamentId,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                260.0, 175.0, 0.0, 0.0),
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
                                tournamentId: widget.tournamentId,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                380.0, 405.0, 0.0, 0.0),
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
                                tournamentId: widget.tournamentId,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                545.0, 350.0, 0.0, 0.0),
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
                                tournamentId: widget.tournamentId,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                380.0, 405.0, 0.0, 0.0),
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
                                tournamentId: widget.tournamentId,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                260.0, 175.0, 0.0, 0.0),
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
                                tournamentId: widget.tournamentId,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  165.0, 60.0, 0.0, 0.0),
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
                                  tournamentId: widget.tournamentId,
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
                              tournamentId: widget.tournamentId,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
