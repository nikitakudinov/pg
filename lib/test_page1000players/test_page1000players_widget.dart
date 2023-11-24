import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_page1000players_model.dart';
export 'test_page1000players_model.dart';

class TestPage1000playersWidget extends StatefulWidget {
  const TestPage1000playersWidget({Key? key}) : super(key: key);

  @override
  _TestPage1000playersWidgetState createState() =>
      _TestPage1000playersWidgetState();
}

class _TestPage1000playersWidgetState extends State<TestPage1000playersWidget> {
  late TestPage1000playersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestPage1000playersModel());
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
          title: Text(
            'Всего в базе ${FFAppState().players.length.toString()}игроков',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (FFAppState().players.first != null)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                  child: Builder(
                    builder: (context) {
                      final playersView =
                          FFAppState().players.toList().take(10).toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: playersView.length,
                        itemBuilder: (context, playersViewIndex) {
                          final playersViewItem = playersView[playersViewIndex];
                          return Text(
                            'Hello World',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
