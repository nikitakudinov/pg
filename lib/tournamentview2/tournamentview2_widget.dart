import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tournamentview2_model.dart';
export 'tournamentview2_model.dart';

class Tournamentview2Widget extends StatefulWidget {
  const Tournamentview2Widget({
    Key? key,
    int? tournamentId,
  })  : this.tournamentId = tournamentId ?? 0,
        super(key: key);

  final int tournamentId;

  @override
  _Tournamentview2WidgetState createState() => _Tournamentview2WidgetState();
}

class _Tournamentview2WidgetState extends State<Tournamentview2Widget> {
  late Tournamentview2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Tournamentview2Model());
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
                Builder(
                  builder: (context) {
                    final round1 = FFAppState()
                        .MAINDATA
                        .matches
                        .where((e) =>
                            (e.matchForTournament.tournamentId ==
                                widget.tournamentId) &&
                            (e.matchTournamentRound == 1))
                        .toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: round1.length,
                      itemBuilder: (context, round1Index) {
                        final round1Item = round1[round1Index];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              round1Item.matchForTournament.tournamentTag,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              round1Item.matchTournamentRound.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              round1Item.matchTournamentPair.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
