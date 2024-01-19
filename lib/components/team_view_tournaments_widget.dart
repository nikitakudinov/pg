import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_view_tournaments_model.dart';
export 'team_view_tournaments_model.dart';

class TeamViewTournamentsWidget extends StatefulWidget {
  const TeamViewTournamentsWidget({
    Key? key,
    required this.teamId,
  }) : super(key: key);

  final int? teamId;

  @override
  _TeamViewTournamentsWidgetState createState() =>
      _TeamViewTournamentsWidgetState();
}

class _TeamViewTournamentsWidgetState extends State<TeamViewTournamentsWidget> {
  late TeamViewTournamentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamViewTournamentsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Учавствует в турнирах',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
          ].addToStart(SizedBox(width: 15.0)).addToEnd(SizedBox(width: 15.0)),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setState(() {
                    _model.activeVISIBILITY = true;
                    _model.comlitedVISIBILITY = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _model.activeVISIBILITY == true
                        ? FlutterFlowTheme.of(context).secondaryBackground
                        : Color(0x00000000),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                    child: Text(
                      'АКТИВНЫЕ',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Cabin Condensed',
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setState(() {
                    _model.activeVISIBILITY = false;
                    _model.comlitedVISIBILITY = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _model.comlitedVISIBILITY == true
                        ? FlutterFlowTheme.of(context).secondaryBackground
                        : Color(0x00000000),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                    child: Text(
                      'ЗАВЕРШЕННЫЕ',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Cabin Condensed',
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 50.0)),
          ),
        ),
        Builder(
          builder: (context) {
            final active = FFAppState()
                .MAINDATA
                .tournaments
                .where((e) => e.tournamentMembersId.contains(widget.teamId))
                .toList();
            return ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: active.length,
              separatorBuilder: (_, __) => SizedBox(height: 5.0),
              itemBuilder: (context, activeIndex) {
                final activeItem = active[activeIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 15.0, 0.0),
                            child: Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  activeItem.tournamentLogo,
                                  width: 45.0,
                                  height: 5.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activeItem.tournamentTag,
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                              Text(
                                activeItem.tournamentName,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ].addToStart(SizedBox(height: 15.0)),
    );
  }
}
