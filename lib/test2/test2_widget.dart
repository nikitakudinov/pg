import '/backend/schema/structs/index.dart';
import '/components/grid_round/grid_round_widget.dart';
import '/components/loadingindicator_widget.dart';
import '/components/matchreport_widget.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().updateVISIBILITYStruct(
          (e) => e..loadingIndicator = true,
        );
      });
      await action_blocks.matchesloader(context);
      setState(() {});
      setState(() {
        FFAppState().updateVISIBILITYStruct(
          (e) => e..loadingIndicator = false,
        );
      });
    });
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
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('TEST');
            },
            child: Icon(
              FFIcons.karrowLeftSM,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          title: Text(
            FFAppState()
                .MAINDATA
                .tournaments
                .where((e) => e.tournamentId == widget.tournamentId)
                .toList()[0]
                .tournamentTag,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            wrapWithModel(
              model: _model.loadingindicatorModel,
              updateCallback: () => setState(() {}),
              child: LoadingindicatorWidget(),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: RefreshIndicator(
            onRefresh: () async {
              setState(() {
                FFAppState().updateVISIBILITYStruct(
                  (e) => e..loadingIndicator = true,
                );
              });
              await action_blocks.matchesloader(context);
              setState(() {});
              setState(() {
                FFAppState().updateVISIBILITYStruct(
                  (e) => e..loadingIndicator = false,
                );
              });
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.vlistITEMModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: VlistITEMWidget(
                      imageSize: 80,
                      backgroundColor: FlutterFlowTheme.of(context).tertiary,
                      title: FFAppState()
                          .MAINDATA
                          .tournaments
                          .where((e) => e.tournamentId == widget.tournamentId)
                          .toList()
                          .first
                          .tournamentTag,
                      subtitle: FFAppState()
                          .MAINDATA
                          .tournaments
                          .where((e) => e.tournamentId == widget.tournamentId)
                          .toList()
                          .first
                          .tournamentName,
                      country: FFAppState()
                          .MAINDATA
                          .tournaments
                          .where((e) => e.tournamentId == widget.tournamentId)
                          .toList()
                          .first
                          .tournamentCountry,
                      flag: FFAppState()
                          .MAINDATA
                          .tournaments
                          .where((e) => e.tournamentId == widget.tournamentId)
                          .toList()
                          .first
                          .tournamentFlag,
                      image: FFAppState()
                          .MAINDATA
                          .tournaments
                          .where((e) => e.tournamentId == widget.tournamentId)
                          .toList()
                          .first
                          .tournamentLogo,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      child: MatchreportWidget(
                                        tournamentmatches: FFAppState()
                                            .MAINDATA
                                            .matches
                                            .where((e) =>
                                                e.matchForTournament
                                                    .tournamentId ==
                                                widget.tournamentId)
                                            .toList(),
                                        tournamentId: widget.tournamentId,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          text: 'Матч репорт',
                          icon: FaIcon(
                            FontAwesomeIcons.fileExport,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(width: 10.0))
                        .addToStart(SizedBox(width: 15.0))
                        .addToEnd(SizedBox(width: 15.0)),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Турнирная сетка',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
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
                                        710.0, 405.0, 0.0, 0.0),
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
                                        875.0, 175.0, 0.0, 0.0),
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
                                          1040.0, 60.0, 0.0, 0.0),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1200.0, 0.0, 0.0, 0.0),
                                    child: wrapWithModel(
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
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 10.0))
                          .addToStart(SizedBox(height: 15.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
