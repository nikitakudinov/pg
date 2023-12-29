import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/filed_country_edite_widget.dart';
import '/components/filededite_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_edite_model.dart';
export 'team_edite_model.dart';

class TeamEditeWidget extends StatefulWidget {
  const TeamEditeWidget({
    Key? key,
    int? teamId,
    int? teamIndex,
  })  : this.teamId = teamId ?? 0,
        this.teamIndex = teamIndex ?? 0,
        super(key: key);

  final int teamId;
  final int teamIndex;

  @override
  _TeamEditeWidgetState createState() => _TeamEditeWidgetState();
}

class _TeamEditeWidgetState extends State<TeamEditeWidget> {
  late TeamEditeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamEditeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 2000),
        callback: (timer) async {
          setState(() {
            _model.teamData = FFAppState()
                .MAINDATA
                .teams
                .where((e) => e.teamId == widget.teamId)
                .toList()[0];
          });
        },
        startImmediately: true,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
            'Управление командой',
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
                Container(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 0.0),
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
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
                                valueOrDefault<String>(
                                  _model.teamData?.teamLogo,
                                  'TAG',
                                ),
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
                                Text(
                                  valueOrDefault<String>(
                                    '${valueOrDefault<String>(
                                      _model.teamData?.teamTag,
                                      'TAG',
                                    )}',
                                    'TAG',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
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
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: FiledediteWidget(
                                                field: 'Тег команды',
                                                initValue:
                                                    _model.teamData?.teamTag,
                                                dataId: widget.teamId,
                                              ),
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
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                fontSize: 10.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 15.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    '${valueOrDefault<String>(
                                      _model.teamData?.teamName,
                                      'TAG',
                                    )}',
                                    'Team name',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
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
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: FiledediteWidget(
                                                field: 'Название команды',
                                                initValue:
                                                    _model.teamData?.teamName,
                                                dataId: widget.teamId,
                                              ),
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
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                fontSize: 10.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 15.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: 20.0,
                                    height: 12.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          _model.teamData?.teamFlag,
                                          'TAG',
                                        ),
                                        width: 20.0,
                                        height: 12.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      '${valueOrDefault<String>(
                                        _model.teamData?.teamCountry,
                                        'TAG',
                                      )}',
                                      'Country',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
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
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: FiledCountryEditeWidget(
                                                field: 'Страна',
                                                dataId: widget.teamId,
                                              ),
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
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
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
                      ]
                          .addToStart(SizedBox(width: 15.0))
                          .addToEnd(SizedBox(width: 15.0)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Состав',
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                borderRadius: 3.0,
                                buttonSize: 25.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                icon: Icon(
                                  Icons.add,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 10.0,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _model.searchPlaerByIdVISIBILITY = true;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Visibility(
                              visible: _model.messageConfirmInvintVISIBILITY,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final searchedPlayerRow =
                                          _model.searchedPlayer.toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: searchedPlayerRow.length,
                                        itemBuilder:
                                            (context, searchedPlayerRowIndex) {
                                          final searchedPlayerRowItem =
                                              searchedPlayerRow[
                                                  searchedPlayerRowIndex];
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: 55.0,
                                                    height: 55.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.network(
                                                        searchedPlayerRowItem
                                                            .playerAvatar,
                                                        width: 55.0,
                                                        height: 55.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${searchedPlayerRowItem.playerTag} | ${searchedPlayerRowItem.playerNickname}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child: Image
                                                                    .network(
                                                                  searchedPlayerRowItem
                                                                      .playerFlag,
                                                                  width: 20.0,
                                                                  height: 12.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              searchedPlayerRowItem
                                                                  .playerCountrie,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Отправить приглашение вступуть в команду этому игроку?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {
                                                _model.messageConfirmInvintVISIBILITY =
                                                    false;
                                                _model.searchPlaerByIdVISIBILITY =
                                                    true;
                                              });
                                            },
                                            text: 'НЕТ',
                                            options: FFButtonOptions(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.addNotification1 =
                                                  await NotificationsTable()
                                                      .insert({
                                                'notification_created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'notification_from_team':
                                                    widget.teamId,
                                                'notification_to_player': _model
                                                    .searchedPlayer
                                                    .first
                                                    .playerUid,
                                                'notification_from_player':
                                                    currentUserUid,
                                                'notification_type':
                                                    'Приглашение в команду',
                                                'notification_body':
                                                    'Команда ${FFAppState().allTEAMS[widget.teamIndex].teamName}  предлагает вступить в ее ряды.',
                                                'notification_category':
                                                    'От команды',
                                              });
                                              setState(() {
                                                _model.messageConfirmInvintVISIBILITY =
                                                    false;
                                                _model.searchPlaerByIdVISIBILITY =
                                                    false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Приглашение игроку отправлено.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );

                                              setState(() {});
                                            },
                                            text: 'ДА',
                                            options: FFButtonOptions(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (_model.searchPlaerByIdVISIBILITY)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: '#UID игрока',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        _model.messageConfirmInvintVISIBILITY =
                                            true;
                                        _model.searchPlaerByIdVISIBILITY =
                                            false;
                                      });
                                      _model.apiResultxwd = await PlayerGroup
                                          .listplayerbyidCall
                                          .call(
                                        idList: _model.textController.text,
                                      );
                                      if ((_model.apiResultxwd?.succeeded ??
                                          true)) {
                                        _model.searchedPlayerData =
                                            await actions.dtPLAYER(
                                          (_model.apiResultxwd?.jsonBody ?? ''),
                                        );
                                        setState(() {
                                          _model.searchedPlayer = _model
                                              .searchedPlayerData!
                                              .toList()
                                              .cast<PlayerStruct>();
                                        });
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Игрок не найден'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }

                                      setState(() {});
                                    },
                                    text: 'Найти',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Cabin Condensed',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Builder(
                          builder: (context) {
                            final temaMembers =
                                FFAppState().curentTeamMembersList.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: temaMembers.length,
                              itemBuilder: (context, temaMembersIndex) {
                                final temaMembersItem =
                                    temaMembers[temaMembersIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            temaMembersItem.playerAvatar,
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${temaMembersItem.playerTag} | ${temaMembersItem.playerNickname}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          temaMembersItem.playerTeamRole
                                              .take(5)
                                              .toList()
                                              .first,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              height: 12.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  temaMembersItem.playerFlag,
                                                  width: 20.0,
                                                  height: 12.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              temaMembersItem.playerCountrie,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ],
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.safePop();
                          },
                          text: 'Отмена',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () {
                            print('saveButton pressed ...');
                          },
                          text: 'Сохранить',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Cabin Condensed',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                _model.logo,
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        if (_model.logo ==
                            'https://supabase.proplayclub.ru/storage/v1/object/public/playground/teamLogos/image-7XR1sw6U%20-%20transformed%20(1).png')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final selectedMedia = await selectMedia(
                                  storageFolderPath: 'teamLogos',
                                  maxWidth: 150.00,
                                  maxHeight: 150.00,
                                  imageQuality: 100,
                                  mediaSource: MediaSource.photoGallery,
                                  multiImage: false,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls =
                                        await uploadSupabaseStorageFiles(
                                      bucketName: 'playground',
                                      selectedFiles: selectedMedia,
                                    );
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload data');
                                    return;
                                  }
                                }

                                setState(() {
                                  _model.logo = _model.uploadedFileUrl;
                                });
                              },
                              text: 'Загрузить ',
                              options: FFButtonOptions(
                                width: 100.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Cabin Condensed',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                          ),
                        if (_model.logo !=
                            'https://supabase.proplayclub.ru/storage/v1/object/public/playground/teamLogos/image-7XR1sw6U%20-%20transformed%20(1).png')
                          FFButtonWidget(
                            onPressed: () async {
                              await deleteSupabaseFileFromPublicUrl(
                                  _model.uploadedFileUrl);
                              setState(() {
                                _model.logo =
                                    'https://supabase.proplayclub.ru/storage/v1/object/public/playground/teamLogos/image-7XR1sw6U%20-%20transformed%20(1).png';
                              });
                            },
                            text: 'Удалить',
                            options: FFButtonOptions(
                              width: 100.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Cabin Condensed',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
