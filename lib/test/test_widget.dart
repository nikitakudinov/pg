import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late TestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.jsonPLAYERS = await PlayerGroup.listplayersCall.call();
      _model.jsonTEAMS = await TeamGroup.listallteamsCall.call();
      setState(() {
        FFAppState().updateMAINDATAStruct(
          (e) => e
            ..players = ((_model.jsonPLAYERS?.jsonBody ?? '')
                    .toList()
                    .map<PlayerStruct?>(PlayerStruct.maybeFromMap)
                    .toList() as Iterable<PlayerStruct?>)
                .withoutNulls
                .toList()
            ..teams = ((_model.jsonTEAMS?.jsonBody ?? '')
                    .toList()
                    .map<TeamStruct?>(TeamStruct.maybeFromMap)
                    .toList() as Iterable<TeamStruct?>)
                .withoutNulls
                .toList(),
        );
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'MainDatraUpdated',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
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
                    final pLAYERSlist = FFAppState()
                        .MAINDATA
                        .players
                        .toList()
                        .take(10)
                        .toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: pLAYERSlist.length,
                      itemBuilder: (context, pLAYERSlistIndex) {
                        final pLAYERSlistItem = pLAYERSlist[pLAYERSlistIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              pLAYERSlistItem.playerNickname,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              pLAYERSlistItem.playerTag,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        );
                      },
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    final pLAYERSlist =
                        FFAppState().MAINDATA.teams.toList().take(10).toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: pLAYERSlist.length,
                      itemBuilder: (context, pLAYERSlistIndex) {
                        final pLAYERSlistItem = pLAYERSlist[pLAYERSlistIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              pLAYERSlistItem.teamName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Cabin Condensed',
                                    color: FlutterFlowTheme.of(context).accent1,
                                  ),
                            ),
                            Text(
                              pLAYERSlistItem.teamTag,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Cabin Condensed',
                                    color: FlutterFlowTheme.of(context).accent1,
                                  ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
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
