import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future loadAllTeamsDataToAppState(BuildContext context) async {
  ApiCallResponse? allTeamsJsonData;
  List<TeamStruct>? convertedData;

  allTeamsJsonData = await TeamGroup.listallteamsCall.call();
  if ((allTeamsJsonData?.succeeded ?? true)) {
    convertedData = await actions.dtTEAM(
      (allTeamsJsonData?.jsonBody ?? ''),
    );
    FFAppState().update(() {
      FFAppState().allTEAMS = convertedData!.toList().cast<TeamStruct>();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Команды обновлены',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 1000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

Future dowloadAllCountrieToAppState(BuildContext context) async {
  ApiCallResponse? allCountrieJsonData;
  List<CountrieStruct>? convertedCountriesData;

  allCountrieJsonData = await CountryGroup.countriesCall.call();
  if ((allCountrieJsonData?.succeeded ?? true)) {
    convertedCountriesData = await actions.dtCOUNTRIE(
      (allCountrieJsonData?.jsonBody ?? ''),
    );
    FFAppState().update(() {
      FFAppState().allCountries =
          convertedCountriesData!.toList().cast<CountrieStruct>();
    });
  }
}

Future loadAuthUserChats(BuildContext context) async {
  ApiCallResponse? apiResultce6;
  List<ChatStruct>? convertedChatsData;

  apiResultce6 = await MessagingGroup.getuserchatsCall.call(
    authUser: currentUserUid,
  );
  if ((apiResultce6?.succeeded ?? true)) {
    convertedChatsData = await actions.dtCHAT(
      MessagingGroup.getuserchatsCall
          .chats(
            (apiResultce6?.jsonBody ?? ''),
          )
          ?.toList(),
    );
    FFAppState().update(() {
      FFAppState().AllAuthUsersChats =
          convertedChatsData!.toList().cast<ChatStruct>();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Chats Uploaderd',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 1000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

Future upadateAuthUserDataValues(BuildContext context) async {
  ApiCallResponse? jsonPlayerData;
  ApiCallResponse? jsonTeamData;

  jsonPlayerData = await PlayerGroup.listplayerbyuidCall.call(
    idList: currentUserUid,
  );
  jsonTeamData = await TeamGroup.listteambyidCall.call(
    idList: PlayerGroup.listplayerbyuidCall
        .playerteam(
          (jsonPlayerData?.jsonBody ?? ''),
        )
        .toString()
        .toString(),
  );
  if ((jsonPlayerData?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().updateAuthPlayerStruct(
        (e) => e
          ..playerCreatedAt = PlayerGroup.listplayerbyuidCall
              .playercreatedat(
                (jsonPlayerData?.jsonBody ?? ''),
              )
              .toString()
          ..playerNickname = PlayerGroup.listplayerbyuidCall
              .playernickname(
                (jsonPlayerData?.jsonBody ?? ''),
              )
              .toString()
          ..playerTag = PlayerGroup.listplayerbyuidCall
              .playertag(
                (jsonPlayerData?.jsonBody ?? ''),
              )
              .toString()
          ..playerFlag = PlayerGroup.listplayerbyuidCall.playerflag(
            (jsonPlayerData?.jsonBody ?? ''),
          )
          ..playerCountrie = PlayerGroup.listplayerbyuidCall
              .playercountrie(
                (jsonPlayerData?.jsonBody ?? ''),
              )
              .toString()
          ..playerAvatar = PlayerGroup.listplayerbyuidCall.playeravatar(
            (jsonPlayerData?.jsonBody ?? ''),
          )
          ..playerUid = PlayerGroup.listplayerbyuidCall
              .playeruid(
                (jsonPlayerData?.jsonBody ?? ''),
              )
              .toString()
          ..playerTeam = PlayerGroup.listplayerbyuidCall.playerteam(
            (jsonPlayerData?.jsonBody ?? ''),
          )
          ..playerTeamLineup = PlayerGroup.listplayerbyuidCall.playerteamlineup(
            (jsonPlayerData?.jsonBody ?? ''),
          )
          ..playerId = PlayerGroup.listplayerbyuidCall.playerid(
            (jsonPlayerData?.jsonBody ?? ''),
          )
          ..playerTeamRole = (PlayerGroup.listplayerbyuidCall.playerteamrole(
            (jsonPlayerData?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .toList()
          ..playerOnline = PlayerGroup.listplayerbyuidCall.playeronline(
            (jsonPlayerData?.jsonBody ?? ''),
          ),
      );
      FFAppState().updateAuthPlayerTeamStruct(
        (e) => e
          ..teamName = TeamGroup.listteambyidCall
              .teamnam(
                (jsonTeamData?.jsonBody ?? ''),
              )
              .toString()
          ..teamCreatedAt = TeamGroup.listteambyidCall
              .teamcreatedat(
                (jsonTeamData?.jsonBody ?? ''),
              )
              .toString()
          ..teamUpdatedAt = TeamGroup.listteambyidCall
              .teamupdatedat(
                (jsonTeamData?.jsonBody ?? ''),
              )
              .toString()
          ..teamTag = TeamGroup.listteambyidCall
              .teamtag(
                (jsonTeamData?.jsonBody ?? ''),
              )
              .toString()
          ..teamFlag = TeamGroup.listteambyidCall.teamflag(
            (jsonTeamData?.jsonBody ?? ''),
          )
          ..teamCountry = TeamGroup.listteambyidCall
              .teamcountry(
                (jsonTeamData?.jsonBody ?? ''),
              )
              .toString()
          ..teamCreator = TeamGroup.listteambyidCall
              .teamcreator(
                (jsonTeamData?.jsonBody ?? ''),
              )
              .toString()
          ..teamLogo = TeamGroup.listteambyidCall.teamlogo(
            (jsonTeamData?.jsonBody ?? ''),
          )
          ..teamRecruitment = TeamGroup.listteambyidCall.teamrecruitment(
            (jsonTeamData?.jsonBody ?? ''),
          )
          ..teamStatus = TeamGroup.listteambyidCall
              .teamstatus(
                (jsonTeamData?.jsonBody ?? ''),
              )
              .toString()
          ..teamId = TeamGroup.listteambyidCall.teamid(
            (jsonTeamData?.jsonBody ?? ''),
          )
          ..teamChatId = TeamGroup.listteambyidCall.teamchatid(
            (jsonTeamData?.jsonBody ?? ''),
          ),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Auth User Data Loaded',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 2400),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

Future loadAuthUserNotifications(BuildContext context) async {
  ApiCallResponse? apiResultfyh;
  List<NotificationStruct>? notificationsData;

  apiResultfyh = await MessagingGroup.gETuserNotificationsCall.call(
    authUser: FFAppState().authPlayer.playerUid,
  );
  if ((apiResultfyh?.succeeded ?? true)) {
    notificationsData = await actions.dtNOTIFICATION(
      (apiResultfyh?.jsonBody ?? ''),
    );
    FFAppState().update(() {
      FFAppState().notofications =
          notificationsData!.toList().cast<NotificationStruct>();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Notifications Updated',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 1000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Api call dont works!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

Future preloadDataOfHomePage(BuildContext context) async {
  await action_blocks.authPlayerUpdater(context);
  await Future.delayed(const Duration(milliseconds: 100));
  await action_blocks.loadAuthUserChats(context);
  await action_blocks.loadAuthUserNotifications(context);
  await action_blocks.onlineStatesUpdater(context);
}

Future sandMessageFromUserToTeamAdmins(BuildContext context) async {}

Future notificationsUpdater(BuildContext context) async {
  ApiCallResponse? apiResultc64;

  apiResultc64 = await MessagingGroup.gETNOTIFICATIONScountCall.call(
    authUser: FFAppState().authPlayer.playerUid,
  );
  if (FFAppState().alertsCount !=
      MessagingGroup.gETNOTIFICATIONScountCall.count(
        (apiResultc64?.jsonBody ?? ''),
      )) {
    FFAppState().update(() {
      FFAppState().alertsCount = MessagingGroup.gETNOTIFICATIONScountCall.count(
        (apiResultc64?.jsonBody ?? ''),
      );
    });
    await action_blocks.loadAuthUserNotifications(context);
  }
}

Future onlineStatesUpdater(BuildContext context) async {
  await PlayersTable().update(
    data: {
      'player_online': true,
    },
    matchingRows: (rows) => rows.eq(
      'player_uid',
      FFAppState().authPlayer.playerUid,
    ),
  );
}

Future sandAlertToTeamAdmins(BuildContext context) async {}

Future loadCurentTeamMembers(
  BuildContext context, {
  int? selectedTeamID,
}) async {
  ApiCallResponse? jsonTeamMembers;
  List<PlayerStruct>? dtTeamMembers;

  FFAppState().update(() {
    FFAppState().selectedTeamId = selectedTeamID!;
  });
  jsonTeamMembers = await PlayerGroup.listplayerbyteamCall.call(
    idList: FFAppState().selectedTeamId.toString(),
  );
  if ((jsonTeamMembers?.succeeded ?? true)) {
    dtTeamMembers = await actions.dtPLAYER(
      (jsonTeamMembers?.jsonBody ?? ''),
    );
    FFAppState().update(() {
      FFAppState().curentTeamMembersList =
          dtTeamMembers!.toList().cast<PlayerStruct>();
    });
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Нет данных в json'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

Future allTeamsUpdater(BuildContext context) async {
  ApiCallResponse? jsonAllTeamsCount;

  jsonAllTeamsCount = await TeamGroup.lISTALLTEAMScountCall.call();
  if (FFAppState().allTEAMScount ==
      TeamGroup.lISTALLTEAMScountCall.count(
        (jsonAllTeamsCount?.jsonBody ?? ''),
      )) {
    FFAppState().update(() {
      FFAppState().allTEAMScount = TeamGroup.lISTALLTEAMScountCall.count(
        (jsonAllTeamsCount?.jsonBody ?? ''),
      );
    });
  } else if (FFAppState().allTEAMScount == 0) {
    FFAppState().update(() {
      FFAppState().allTEAMScount = TeamGroup.lISTALLTEAMScountCall.count(
        (jsonAllTeamsCount?.jsonBody ?? ''),
      );
    });
    await action_blocks.loadAllTeamsDataToAppState(context);
  } else {
    FFAppState().update(() {
      FFAppState().allTEAMScount = TeamGroup.lISTALLTEAMScountCall.count(
        (jsonAllTeamsCount?.jsonBody ?? ''),
      );
    });
    await action_blocks.loadAllTeamsDataToAppState(context);
  }
}

Future authPlayerUpdater(BuildContext context) async {
  ApiCallResponse? jsonAuthUserUpdated;

  jsonAuthUserUpdated = await PlayerGroup.authplayerupdatedCall.call(
    uid: currentUserUid,
  );
  if (FFAppState().authUserUpdated !=
      PlayerGroup.authplayerupdatedCall.playerupdateat(
        (jsonAuthUserUpdated?.jsonBody ?? ''),
      )) {
    await action_blocks.upadateAuthUserDataValues(context);
    FFAppState().update(() {
      FFAppState().authUserUpdated = PlayerGroup.authplayerupdatedCall
          .playerupdateat(
            (jsonAuthUserUpdated?.jsonBody ?? ''),
          )
          .toString()
          .toString();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Данные о пользолвателе обвновлены',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 1000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

Future chasUpdater(BuildContext context) async {
  ApiCallResponse? apiResult9bd;

  apiResult9bd = await MessagingGroup.gETUSERCHATScountCall.call(
    authUser: currentUserUid,
  );
  if (FFAppState().chatsCount !=
      MessagingGroup.gETUSERCHATScountCall.count(
        (apiResult9bd?.jsonBody ?? ''),
      )) {
    await action_blocks.loadAuthUserChats(context);
    FFAppState().update(() {
      FFAppState().chatsCount = MessagingGroup.gETUSERCHATScountCall.count(
        (apiResult9bd?.jsonBody ?? ''),
      );
    });
  }
}

Future singlChatUpdater(
  BuildContext context, {
  int? chatId,
  int? chatIndex,
}) async {
  ApiCallResponse? apiResult7br;
  ApiCallResponse? apiResultmyf;

  apiResult7br = await MessagingGroup.getchatbyidCall.call(
    chatID: chatId?.toString(),
  );
  if ((apiResult7br?.succeeded ?? true)) {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('TRUE'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('FALSE'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
    apiResultmyf = await MessagingGroup.getchatbyidCall.call(
      chatID: chatId?.toString(),
    );
    FFAppState().update(() {
      FFAppState().updateAllAuthUsersChatsAtIndex(
        chatIndex!,
        (_) => ChatStruct.fromMap((apiResultmyf?.jsonBody ?? '')),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Singl chat updated',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

Future loadALLplayers(BuildContext context) async {
  ApiCallResponse? jSONallPLAYERSdata;
  List<PlayerStruct>? dtPLAYERdata;

  jSONallPLAYERSdata = await PlayerGroup.listplayersCall.call();
  if ((jSONallPLAYERSdata?.succeeded ?? true)) {
    dtPLAYERdata = await actions.dtPLAYER(
      (jSONallPLAYERSdata?.jsonBody ?? ''),
    );
    FFAppState().update(() {
      FFAppState().players = dtPLAYERdata!.toList().cast<PlayerStruct>();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'В память загружено ${FFAppState().players.length.toString()}профилей игроков',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

Future loadSearchResults1(
  BuildContext context, {
  required String? searchText,
}) async {
  ApiCallResponse? jSONsearchRESULTSdata;
  List<PlayerStruct>? dTsearchResults;

  jSONsearchRESULTSdata = await PlayerGroup.playersearchCall.call(
    searchText: searchText,
  );
  if ((jSONsearchRESULTSdata?.succeeded ?? true)) {
    dTsearchResults = await actions.dtPLAYER(
      (jSONsearchRESULTSdata?.jsonBody ?? ''),
    );
    FFAppState().update(() {
      FFAppState().players = dTsearchResults!.toList().cast<PlayerStruct>();
    });
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('as'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

Future addMessageReadedLoop(BuildContext context) async {
  while (FFAppState().ureadedMessagesCount != 3) {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text(FFAppState().ureadedMessagesCount.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
    FFAppState().update(() {
      FFAppState().ureadedMessagesCount = FFAppState().ureadedMessagesCount + 1;
    });
  }
}

Future creatTournamentMatches32(
  BuildContext context, {
  required int? tournamentID,
}) async {
  // R1P1
  await MatchesTable().insert({
    'match_tournament_round': 1,
    'match_tournament_pair': 1,
    'match_for_tournament': tournamentID,
    'match_status': 'Соперники не определены',
    'match_refery': 'не определен',
    'match_date': 'матч еще не состоялся',
  });
  // R1P2
  await MatchesTable().insert({
    'match_tournament_round': 1,
    'match_tournament_pair': 2,
    'match_for_tournament': tournamentID,
    'match_status': 'Соперники не определены',
    'match_refery': 'не определен',
    'match_date': 'матч еще не состоялся',
  });
  // R1P3
  await MatchesTable().insert({
    'match_tournament_round': 1,
    'match_tournament_pair': 3,
    'match_for_tournament': tournamentID,
    'match_status': 'Соперники не определены',
    'match_refery': 'не определен',
    'match_date': 'матч еще не состоялся',
  });
  // R1P4
  await MatchesTable().insert({
    'match_tournament_round': 1,
    'match_tournament_pair': 4,
    'match_for_tournament': tournamentID,
    'match_status': 'Соперники не определены',
    'match_refery': 'не определен',
    'match_date': 'матч еще не состоялся',
  });
}
