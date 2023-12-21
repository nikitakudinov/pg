import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'match_report_add_model.dart';
export 'match_report_add_model.dart';

class MatchReportAddWidget extends StatefulWidget {
  const MatchReportAddWidget({
    Key? key,
    required this.tournamentID,
  }) : super(key: key);

  final int? tournamentID;

  @override
  _MatchReportAddWidgetState createState() => _MatchReportAddWidgetState();
}

class _MatchReportAddWidgetState extends State<MatchReportAddWidget> {
  late MatchReportAddModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchReportAddModel());
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
            'Создать мать репорт',
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
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController1 ??=
                                  FormFieldController<String>(null),
                              options: ['1', '2', '3', '4', '5'],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue1 = val),
                              height: 40.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'РАУНД',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              borderWidth: 1.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController2 ??=
                                  FormFieldController<String>(null),
                              options: () {
                                if (_model.dropDownValue1 == '1') {
                                  return FFAppConstants.List16;
                                } else if (_model.dropDownValue1 == '2') {
                                  return FFAppConstants.List8;
                                } else if (_model.dropDownValue1 == '3') {
                                  return FFAppConstants.List4;
                                } else if (_model.dropDownValue1 == '4') {
                                  return FFAppConstants.List2;
                                } else {
                                  return FFAppConstants.List1;
                                }
                              }(),
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue2 = val),
                              height: 40.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'ПАРА',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              borderWidth: 1.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                      .divide(SizedBox(width: 10.0))
                      .addToStart(SizedBox(width: 15.0))
                      .addToEnd(SizedBox(width: 15.0)),
                ),
              ),
              if ((_model.dropDownValue1 != null &&
                      _model.dropDownValue1 != '') &&
                  (_model.dropDownValue2 != null &&
                      _model.dropDownValue2 != ''))
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Builder(
                    builder: (context) {
                      final match = FFAppState()
                          .tournamentMatches
                          .where((e) =>
                              (e.matchTournamentRound ==
                                  valueOrDefault<int>(
                                    functions
                                        .stringTOinteger(_model.dropDownValue1),
                                    1,
                                  )) &&
                              (e.matchTournamentPair ==
                                  valueOrDefault<int>(
                                    functions
                                        .stringTOinteger(_model.dropDownValue2),
                                    1,
                                  )))
                          .toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: match.length,
                        itemBuilder: (context, matchIndex) {
                          final matchItem = match[matchIndex];
                          return Container(
                              width: 100, height: 100, color: Colors.green);
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
