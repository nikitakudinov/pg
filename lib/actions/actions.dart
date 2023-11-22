import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
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
        duration: Duration(milliseconds: 4000),
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Страны и флаги загружены в апстейт успешно',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}

Future loadAuthUserChats(BuildContext context) async {
  ApiCallResponse? apiResultce6;
  List<ChatStruct>? convertedChatsData;

  apiResultce6 = await MessagingGroup.getuserchatsCall.call(
    authUser: FFAppState().authPlayer.playerUid,
  );
  if ((apiResultce6?.succeeded ?? true)) {
    convertedChatsData = await actions.dtCHAT(
      (apiResultce6?.jsonBody ?? ''),
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
        duration: Duration(milliseconds: 4000),
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
        duration: Duration(milliseconds: 4000),
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
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Allerts updated'),
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
  }
}
