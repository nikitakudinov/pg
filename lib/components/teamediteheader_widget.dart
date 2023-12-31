import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/filed_country_edite_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'teamediteheader_model.dart';
export 'teamediteheader_model.dart';

class TeamediteheaderWidget extends StatefulWidget {
  const TeamediteheaderWidget({
    Key? key,
    required this.teamId,
  }) : super(key: key);

  final int? teamId;

  @override
  _TeamediteheaderWidgetState createState() => _TeamediteheaderWidgetState();
}

class _TeamediteheaderWidgetState extends State<TeamediteheaderWidget> {
  late TeamediteheaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamediteheaderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.tag = FFAppState()
            .MAINDATA
            .teams
            .where((e) => e.teamId == widget.teamId)
            .toList()[0]
            .teamTag;
        _model.name = FFAppState()
            .MAINDATA
            .teams
            .where((e) => e.teamId == widget.teamId)
            .toList()[0]
            .teamName;
        _model.country = FFAppState()
            .MAINDATA
            .teams
            .where((e) => e.teamId == widget.teamId)
            .toList()[0]
            .teamCountry;
        _model.flag = FFAppState()
            .MAINDATA
            .teams
            .where((e) => e.teamId == widget.teamId)
            .toList()[0]
            .teamFlag;
        _model.logo = FFAppState()
            .MAINDATA
            .teams
            .where((e) => e.teamId == widget.teamId)
            .toList()[0]
            .teamLogo;
      });
    });

    _model.fieldTagController ??= TextEditingController();
    _model.fieldTagFocusNode ??= FocusNode();

    _model.fieldNameController ??= TextEditingController();
    _model.fieldNameFocusNode ??= FocusNode();
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
      height: 130.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    _model.logo,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.fieldVISIBILITY)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              '${_model.tag}',
                              'TAG',
                            ),
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          if (_model.editeButtonVISIBILITY)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.fieldVISIBILITY = false;
                                  _model.editeButtonVISIBILITY = false;
                                  _model.tagediteboxVISIBILITY = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 5.0, 5.0, 5.0),
                                  child: Text(
                                    'ИЗМЕНИТЬ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          fontSize: 10.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    if (_model.tagediteboxVISIBILITY)
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 32.0,
                              constraints: BoxConstraints(
                                minWidth: 80.0,
                                maxWidth: 150.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.fieldTagController,
                                    focusNode: _model.fieldTagFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      filled: true,
                                      fillColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 10.0, 15.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 12.0,
                                        ),
                                    validator: _model
                                        .fieldTagControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: (_model.fieldTagController.text ==
                                              null ||
                                          _model.fieldTagController.text == '')
                                      ? null
                                      : () async {
                                          await TeamsTable().update(
                                            data: {
                                              'team_tag': _model
                                                  .fieldTagController.text,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'team_id',
                                              widget.teamId,
                                            ),
                                          );
                                          setState(() {
                                            FFAppState().updateMAINDATAStruct(
                                              (e) => e..teams = [],
                                            );
                                          });
                                          await action_blocks
                                              .teamsloader(context);
                                          setState(() {});
                                          setState(() {
                                            _model.fieldVISIBILITY = true;
                                            _model.editeButtonVISIBILITY = true;
                                            _model.tagediteboxVISIBILITY =
                                                false;
                                            _model.tag =
                                                _model.fieldTagController.text;
                                          });

                                          setState(() {});
                                        },
                                  text: '',
                                  icon: Icon(
                                    FFIcons.keditPencilLine01,
                                    color: _model.fieldTagController.text ==
                                                null ||
                                            _model.fieldTagController.text == ''
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context).accent2,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 32.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        35.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(5.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ].divide(SizedBox(width: 15.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.fieldVISIBILITY)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              '${_model.name}',
                              'Название команды',
                            ),
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                          if (_model.editeButtonVISIBILITY)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.fieldVISIBILITY = false;
                                  _model.editeButtonVISIBILITY = false;
                                  _model.nameediteboxVISIBILITY = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 5.0, 5.0, 5.0),
                                  child: Text(
                                    'ИЗМЕНИТЬ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          fontSize: 10.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    if (_model.nameediteboxVISIBILITY)
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 32.0,
                              constraints: BoxConstraints(
                                minWidth: 80.0,
                                maxWidth: 150.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.fieldNameController,
                                    focusNode: _model.fieldNameFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.fieldNameController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          _model.name =
                                              _model.fieldNameController.text;
                                        });
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      filled: true,
                                      fillColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 10.0, 15.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          fontSize: 12.0,
                                        ),
                                    validator: _model
                                        .fieldNameControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: (_model.fieldNameController.text ==
                                              null ||
                                          _model.fieldNameController.text == '')
                                      ? null
                                      : () async {
                                          await TeamsTable().update(
                                            data: {
                                              'team_name': _model.name,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'team_id',
                                              widget.teamId,
                                            ),
                                          );
                                          setState(() {
                                            FFAppState().updateMAINDATAStruct(
                                              (e) => e..teams = [],
                                            );
                                          });
                                          await action_blocks
                                              .teamsloader(context);
                                          setState(() {});
                                          setState(() {
                                            _model.fieldVISIBILITY = true;
                                            _model.editeButtonVISIBILITY = true;
                                            _model.nameediteboxVISIBILITY =
                                                false;
                                            _model.name =
                                                _model.fieldNameController.text;
                                          });

                                          setState(() {});
                                        },
                                  text: '',
                                  icon: Icon(
                                    FFIcons.keditPencilLine01,
                                    color: _model.fieldNameController.text ==
                                                null ||
                                            _model.fieldNameController.text ==
                                                ''
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context).accent2,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 32.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        35.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Cabin Condensed',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(5.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ].divide(SizedBox(width: 15.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: Container(
                        width: 20.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            _model.flag,
                            width: 20.0,
                            height: 12.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                      child: Text(
                        _model.country,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    if (_model.editeButtonVISIBILITY)
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showAlignedDialog(
                              context: context,
                              isGlobal: true,
                              avoidOverflow: false,
                              targetAnchor: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return Material(
                                  color: Colors.transparent,
                                  child: FiledCountryEditeWidget(
                                    field: 'Страна',
                                    dataId: widget.teamId!,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: Text(
                                'ИЗМЕНИТЬ',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Cabin Condensed',
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      fontSize: 10.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ].addToStart(SizedBox(width: 15.0)).addToEnd(SizedBox(width: 15.0)),
        ),
      ),
    );
  }
}
