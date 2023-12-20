import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/t_o_u_r_n_a_m_e_n_tgrid_r_o_u_n_d_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tournament_view_model.dart';
export 'tournament_view_model.dart';

class TournamentViewWidget extends StatefulWidget {
  const TournamentViewWidget({
    Key? key,
    this.members,
    this.organizators,
    int? tournamentID,
  })  : this.tournamentID = tournamentID ?? 0,
        super(key: key);

  final List<int>? members;
  final List<String>? organizators;
  final int tournamentID;

  @override
  _TournamentViewWidgetState createState() => _TournamentViewWidgetState();
}

class _TournamentViewWidgetState extends State<TournamentViewWidget> {
  late TournamentViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TournamentViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.jsonTOURNAMENTMATCHESdata =
          await MatchGroup.tournamentmatchesCall.call(
        tournamentID: widget.tournamentID,
      );
      if ((_model.jsonTOURNAMENTMATCHESdata?.succeeded ?? true)) {
        _model.dtTOURNAMENTMATCHESdata = await actions.dtMATCH(
          (_model.jsonTOURNAMENTMATCHESdata?.jsonBody ?? ''),
        );
        setState(() {
          FFAppState().tournamentMatches =
              _model.dtTOURNAMENTMATCHESdata!.toList().cast<MatchStruct>();
        });
      }
    });

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
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
          automaticallyImplyLeading: true,
          title: Text(
            'Турнир',
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
                Container(
                  decoration: BoxDecoration(),
                  child: Container(
                    width: double.infinity,
                    color: Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableController1,
                      child: ExpandablePanel(
                        header: Container(
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.users,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Участники турнира',
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final tournamentItem = FFAppState()
                                  .tournaments
                                  .where((e) =>
                                      e.tournamentId == widget.tournamentID)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: tournamentItem.length,
                                itemBuilder: (context, tournamentItemIndex) {
                                  final tournamentItemItem =
                                      tournamentItem[tournamentItemIndex];
                                  return Builder(
                                    builder: (context) {
                                      final tournamentMembers =
                                          tournamentItemItem.tournamentMembers
                                              .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: tournamentMembers.length,
                                        itemBuilder:
                                            (context, tournamentMembersIndex) {
                                          final tournamentMembersItem =
                                              tournamentMembers[
                                                  tournamentMembersIndex];
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        child: Image.network(
                                                          tournamentMembersItem
                                                              .teamLogo,
                                                          width: 50.0,
                                                          height: 50.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        tournamentMembersItem
                                                            .teamName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Text(
                                                        tournamentMembersItem
                                                            .teamTag,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 20.0,
                                                              height: 12.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child: Image
                                                                    .network(
                                                                  tournamentMembersItem
                                                                      .teamFlag,
                                                                  width: 20.0,
                                                                  height: 12.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            tournamentMembersItem
                                                                .teamCountry,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        theme: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Container(
                    width: double.infinity,
                    color: FlutterFlowTheme.of(context).secondary,
                    child: ExpandableNotifier(
                      controller: _model.expandableController2,
                      child: ExpandablePanel(
                        header: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 0.0, 15.0),
                            child: Text(
                              'Турнирная сетка',
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                          ),
                        ),
                        collapsed: Container(),
                        expanded: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.tOURNAMENTgridROUNDModel1,
                                updateCallback: () => setState(() {}),
                                child: TOURNAMENTgridROUNDWidget(
                                  round: 1,
                                  iteamspacing: 5,
                                  paddingtop: 0,
                                  itemheight: 100,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.tOURNAMENTgridROUNDModel2,
                                updateCallback: () => setState(() {}),
                                child: TOURNAMENTgridROUNDWidget(
                                  round: 2,
                                  iteamspacing: 100,
                                  paddingtop: 0,
                                  itemheight: 100,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.tOURNAMENTgridROUNDModel3,
                                updateCallback: () => setState(() {}),
                                child: TOURNAMENTgridROUNDWidget(
                                  round: 3,
                                  iteamspacing: 775,
                                  paddingtop: 0,
                                  itemheight: 95,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.tOURNAMENTgridROUNDModel4,
                                updateCallback: () => setState(() {}),
                                child: TOURNAMENTgridROUNDWidget(
                                  round: 4,
                                  iteamspacing: 1450,
                                  paddingtop: 0,
                                  itemheight: 95,
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 15.0))
                                .addToStart(SizedBox(width: 15.0)),
                          ),
                        ),
                        theme: ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                    ),
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
