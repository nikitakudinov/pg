import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 't_o_u_r_n_a_m_e_n_tgrid_r_o_u_n_d_model.dart';
export 't_o_u_r_n_a_m_e_n_tgrid_r_o_u_n_d_model.dart';

class TOURNAMENTgridROUNDWidget extends StatefulWidget {
  const TOURNAMENTgridROUNDWidget({
    Key? key,
    int? round,
    int? iteamspacing,
    int? paddingtop,
    int? itemheight,
  })  : this.round = round ?? 0,
        this.iteamspacing = iteamspacing ?? 0,
        this.paddingtop = paddingtop ?? 0,
        this.itemheight = itemheight ?? 0,
        super(key: key);

  final int round;
  final int iteamspacing;
  final int paddingtop;
  final int itemheight;

  @override
  _TOURNAMENTgridROUNDWidgetState createState() =>
      _TOURNAMENTgridROUNDWidgetState();
}

class _TOURNAMENTgridROUNDWidgetState extends State<TOURNAMENTgridROUNDWidget> {
  late TOURNAMENTgridROUNDModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TOURNAMENTgridROUNDModel());
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
      width: 220.0,
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: Text(
                'РАУНД ${widget.round.toString()}',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  valueOrDefault<double>(
                    widget.paddingtop.toDouble(),
                    0.0,
                  ),
                  0.0,
                  0.0),
              child: Builder(
                builder: (context) {
                  final round = FFAppState()
                      .tournamentMatches
                      .where((e) => e.matchTournamentRound == widget.round)
                      .toList()
                      .sortedList((e) => e.matchTournamentPair)
                      .toList();
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: round.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: widget.iteamspacing.toDouble()),
                    itemBuilder: (context, roundIndex) {
                      final roundItem = round[roundIndex];
                      return Container(
                        width: 300.0,
                        height: widget.itemheight.toDouble(),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      roundItem.matchPlannedDate == '0'
                                          ? 'Дата матча не запланирована'
                                          : 'Матч состоится ${valueOrDefault<String>(
                                              roundItem.matchPlannedDate,
                                              '0',
                                            )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      '${roundItem.matchTournamentPair.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${roundItem.matchRival1.teamName}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                roundItem.matchRival1Wins
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${roundItem.matchRival2.teamName}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                roundItem.matchRival2Wins
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
