import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.loadAuthUserChats(context);
      _model.apiResultqcj = await PlayerGroup.listplayerbyuidCall.call(
        idList: currentUserUid,
      );
      _model.teambyid = await TeamGroup.listteambyidCall.call(
        idList: PlayerGroup.listplayerbyuidCall
            .playerteam(
              (_model.apiResultqcj?.jsonBody ?? ''),
            )
            .toString()
            .toString(),
      );
      if ((_model.apiResultqcj?.succeeded ?? true)) {
        setState(() {
          FFAppState().updateAuthenticateduserStruct(
            (e) => e
              ..id = PlayerGroup.listplayerbyuidCall.playerid(
                (_model.apiResultqcj?.jsonBody ?? ''),
              )
              ..team = PlayerGroup.listplayerbyuidCall.playerteam(
                (_model.apiResultqcj?.jsonBody ?? ''),
              )
              ..uid = currentUserUid
              ..nickname = PlayerGroup.listplayerbyuidCall
                  .playernickname(
                    (_model.apiResultqcj?.jsonBody ?? ''),
                  )
                  .toString()
              ..avatar = PlayerGroup.listplayerbyuidCall.playeravatar(
                (_model.apiResultqcj?.jsonBody ?? ''),
              ),
          );
        });
      }
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
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.output,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('LoginPage', context.mounted);
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  FFAppState().authenticateduser.nickname,
                  '0',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                child: FutureBuilder<List<AlertsRow>>(
                  future: AlertsTable().queryRows(
                    queryFn: (q) => q.eq(
                      'to_user',
                      currentUserUid,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<AlertsRow> listViewAlertsRowList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewAlertsRowList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewAlertsRow =
                            listViewAlertsRowList[listViewIndex];
                        return FutureBuilder<List<TeamsRow>>(
                          future: TeamsTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'team_id',
                              listViewAlertsRow.fromTeam,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<TeamsRow> columnTeamsRowList = snapshot.data!;
                            final columnTeamsRow = columnTeamsRowList.isNotEmpty
                                ? columnTeamsRowList.first
                                : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        () {
                                          if (listViewAlertsRow.type ==
                                              'Приглашение в команду') {
                                            return 'Команда ${columnTeamsRow?.teamName} предлагает вступить в ее состав';
                                          } else if (listViewAlertsRow.type ==
                                              'Исключение из команды') {
                                            return 'Вы были исключены из команды';
                                          } else {
                                            return '0';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                if (listViewAlertsRow.type !=
                                    'Исключение из команды')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: 45.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.network(
                                                columnTeamsRow!.teamLogo!,
                                                width: 45.0,
                                                height: 45.0,
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
                                              columnTeamsRow!.teamName!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 20.0,
                                                  height: 12.0,
                                                  decoration: BoxDecoration(),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.network(
                                                      columnTeamsRow!.teamFlag!,
                                                      width: 20.0,
                                                      height: 12.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  columnTeamsRow!.teamCountry!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (listViewAlertsRow.type !=
                                        'Исключение из команды')
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Отказаться',
                                          options: FFButtonOptions(
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    if (listViewAlertsRow.type !=
                                        'Исключение из команды')
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.chatByTeamId =
                                                await MessagingGroup
                                                    .chatbyteamidCall
                                                    .call(
                                              idList: columnTeamsRow?.teamId
                                                  ?.toString(),
                                            );
                                            _model.userByYathUID =
                                                await PlayerGroup
                                                    .listplayerbyuidCall
                                                    .call(
                                              idList: currentUserUid,
                                            );
                                            _model.fromTeamInfo =
                                                await TeamGroup.listteambyidCall
                                                    .call(
                                              idList: listViewAlertsRow.fromTeam
                                                  ?.toString(),
                                            );
                                            setState(() {
                                              _model.chatMembers =
                                                  (MessagingGroup
                                                          .chatbyteamidCall
                                                          .chatmembers(
                                                (_model.chatByTeamId
                                                        ?.jsonBody ??
                                                    ''),
                                              ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()!
                                                      .map((e) => e.toString())
                                                      .toList()
                                                      .cast<String>();
                                            });
                                            setState(() {
                                              _model.removeFromChatMembers(
                                                  currentUserUid);
                                            });
                                            await MessageTable().insert({
                                              'message_sanded_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'message_sander': 'Дозорный бот',
                                              'message_body':
                                                  'Игрок ${PlayerGroup.listplayerbyuidCall.playernickname(
                                                        (_model.userByYathUID
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString()} покинул команду',
                                              'message_chat': MessagingGroup
                                                  .chatbyteamidCall
                                                  .chatid(
                                                (_model.chatByTeamId
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              'message_sander_avatar':
                                                  'https://supabase.proplayclub.ru/storage/v1/object/public/playground/playerAvatars/Iconarchive-Robot-Avatar-Blue-2-Robot-Avatar.512.png',
                                              'message_parametrSTRING1':
                                                  currentUserUid,
                                              'message_type':
                                                  'Сообщение от бота Игрок покину команду',
                                            });
                                            await ChatsTable().update(
                                              data: {
                                                'chat_members':
                                                    _model.chatMembers,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'chat_id',
                                                valueOrDefault<int>(
                                                  MessagingGroup
                                                      .chatbyteamidCall
                                                      .chatid(
                                                    (_model.chatByTeamId
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  0,
                                                ),
                                              ),
                                            );
                                            await PlayersTable().update(
                                              data: {
                                                'player_team':
                                                    listViewAlertsRow.fromTeam,
                                                'player_team_role':
                                                    'Игрок команды',
                                                'player_team_lineup': false,
                                                'player_tag':
                                                    TeamGroup.listteambyidCall
                                                        .teamtag(
                                                          (_model.fromTeamInfo
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString(),
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'player_uid',
                                                currentUserUid,
                                              ),
                                            );
                                            await MessageTable().insert({
                                              'message_sanded_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'message_sander': 'Дозорный бот',
                                              'message_body':
                                                  'Игрок ${PlayerGroup.listplayerbyuidCall.playernickname(
                                                        (_model.userByYathUID
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString()}вступил в команду',
                                              'message_chat':
                                                  columnTeamsRow?.teamChatId,
                                              'message_sander_avatar':
                                                  'https://supabase.proplayclub.ru/storage/v1/object/public/playground/playerAvatars/Iconarchive-Robot-Avatar-Blue-2-Robot-Avatar.512.png',
                                              'message_parametrSTRING1':
                                                  currentUserUid,
                                              'message_type':
                                                  'Сообщение от бота Игрок покину команду',
                                            });

                                            context.pushNamed('HomePage');

                                            await AlertsTable().delete(
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                listViewAlertsRow.id,
                                              ),
                                            );

                                            setState(() {});
                                          },
                                          text: 'Вступить',
                                          options: FFButtonOptions(
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    if (listViewAlertsRow.type ==
                                        'Исключение из команды')
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await AlertsTable().delete(
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                listViewAlertsRow.id,
                                              ),
                                            );

                                            context.pushNamed('HomePage');
                                          },
                                          text: 'Ясно',
                                          options: FFButtonOptions(
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              Builder(
                builder: (context) {
                  final allChatsList = FFAppState().AllAuthUsersChats.toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: allChatsList.length,
                    itemBuilder: (context, allChatsListIndex) {
                      final allChatsListItem = allChatsList[allChatsListIndex];
                      return Builder(
                        builder: (context) {
                          final chatMember =
                              allChatsListItem.chatMembers.toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(chatMember.length,
                                (chatMemberIndex) {
                              final chatMemberItem =
                                  chatMember[chatMemberIndex];
                              return Text(
                                chatMemberItem,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              );
                            }),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
