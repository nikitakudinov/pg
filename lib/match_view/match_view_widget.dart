import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'match_view_model.dart';
export 'match_view_model.dart';

class MatchViewWidget extends StatefulWidget {
  const MatchViewWidget({
    Key? key,
    int? matchID,
  })  : this.matchID = matchID ?? 0,
        super(key: key);

  final int matchID;

  @override
  _MatchViewWidgetState createState() => _MatchViewWidgetState();
}

class _MatchViewWidgetState extends State<MatchViewWidget> {
  late MatchViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchViewModel());
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
            'Матч',
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
          child: Visibility(
            visible: (_model.curentMatchData.isNotEmpty) != null,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFAppState()
                                .curentMatchData
                                .first
                                .matchForTournament
                                .tournamentTag,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            'Раунд',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            FFAppState()
                                .curentMatchData
                                .first
                                .matchTournamentRound
                                .toString(),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ].divide(SizedBox(width: 5.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    FFAppState()
                                                .curentMatchData
                                                .first
                                                .matchRival1
                                                .teamName ==
                                            'Не определен'
                                        ? 'https://supabase.proplayclub.ru/storage/v1/object/public/playground/unknowLogo.png'
                                        : FFAppState()
                                            .curentMatchData
                                            .first
                                            .matchRival2
                                            .teamLogo,
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                '${FFAppState().curentMatchData.first.matchRival1.teamName}',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${FFAppState().curentMatchData.first.matchRival1Wins.toString()} - ${FFAppState().curentMatchData.first.matchRival2Wins.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    FFAppState()
                                                .curentMatchData
                                                .first
                                                .matchRival2
                                                .teamName ==
                                            'Не определен'
                                        ? 'https://supabase.proplayclub.ru/storage/v1/object/public/playground/unknowLogo.png'
                                        : FFAppState()
                                            .curentMatchData
                                            .first
                                            .matchRival2
                                            .teamLogo,
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                '${FFAppState().curentMatchData.first.matchRival2.teamName}',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${'${FFAppState().curentMatchData.first.matchDate}'}',
                            style: FlutterFlowTheme.of(context).bodyMedium,
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
