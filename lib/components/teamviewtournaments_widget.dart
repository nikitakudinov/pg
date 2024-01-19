import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'teamviewtournaments_model.dart';
export 'teamviewtournaments_model.dart';

class TeamviewtournamentsWidget extends StatefulWidget {
  const TeamviewtournamentsWidget({Key? key}) : super(key: key);

  @override
  _TeamviewtournamentsWidgetState createState() =>
      _TeamviewtournamentsWidgetState();
}

class _TeamviewtournamentsWidgetState extends State<TeamviewtournamentsWidget> {
  late TeamviewtournamentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamviewtournamentsModel());
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
              child: Text(
                'Учавствует в турнирах',
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
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
        ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [],
        ),
      ].addToStart(SizedBox(height: 15.0)),
    );
  }
}