import '/backend/schema/structs/index.dart';
import '/components/vlist_i_t_e_m_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/actions/actions.dart' as action_blocks;
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
      await action_blocks.teamsloader(context);
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          await action_blocks.teamsupdater(context);
        },
        startImmediately: true,
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
                    final tOURNAMENTSlist = FFAppState()
                        .MAINDATA
                        .tournaments
                        .toList()
                        .take(10)
                        .toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: tOURNAMENTSlist.length,
                      itemBuilder: (context, tOURNAMENTSlistIndex) {
                        final tOURNAMENTSlistItem =
                            tOURNAMENTSlist[tOURNAMENTSlistIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'TEST2',
                              queryParameters: {
                                'tournamentId': serializeParam(
                                  tOURNAMENTSlistItem.tournamentId,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: VlistITEMWidget(
                            key: Key(
                                'Keyjqz_${tOURNAMENTSlistIndex}_of_${tOURNAMENTSlist.length}'),
                            imageSize: 50,
                            backgroundColor:
                                FlutterFlowTheme.of(context).tertiary,
                            title: tOURNAMENTSlistItem.tournamentTag,
                            subtitle: tOURNAMENTSlistItem.tournamentName,
                            country: tOURNAMENTSlistItem.tournamentCountry,
                            flag: tOURNAMENTSlistItem.tournamentFlag,
                            image: tOURNAMENTSlistItem.tournamentLogo,
                          ),
                        );
                      },
                    );
                  },
                ),
                Text(
                  FFAppState().MAINDATA.authplayer.playerNickname,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
