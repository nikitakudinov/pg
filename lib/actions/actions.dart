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
  ApiCallResponse? apiResultp0p;
  List<TeamStruct>? dtPLAYERTEAM;

  apiResultp0p = await PlayerGroup.listplayerbyuidCall.call(
    idList: currentUserUid,
  );
  if ((apiResultp0p?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().updateAuthPlayerStruct(
        (e) => e
          ..playerCreatedAt = PlayerGroup.listplayerbyuidCall
              .playercreatedat(
                (apiResultp0p?.jsonBody ?? ''),
              )
              .toString()
          ..playerNickname = PlayerGroup.listplayerbyuidCall
              .playernickname(
                (apiResultp0p?.jsonBody ?? ''),
              )
              .toString()
          ..playerTag = PlayerGroup.listplayerbyuidCall
              .playertag(
                (apiResultp0p?.jsonBody ?? ''),
              )
              .toString()
          ..playerFlag = PlayerGroup.listplayerbyuidCall.playerflag(
            (apiResultp0p?.jsonBody ?? ''),
          )
          ..playerCountrie = PlayerGroup.listplayerbyuidCall
              .playercountrie(
                (apiResultp0p?.jsonBody ?? ''),
              )
              .toString()
          ..playerAvatar = PlayerGroup.listplayerbyuidCall.playeravatar(
            (apiResultp0p?.jsonBody ?? ''),
          )
          ..playerUid = PlayerGroup.listplayerbyuidCall
              .playeruid(
                (apiResultp0p?.jsonBody ?? ''),
              )
              .toString()
          ..playerTeamLineup = PlayerGroup.listplayerbyuidCall.playerteamlineup(
            (apiResultp0p?.jsonBody ?? ''),
          )
          ..playerId = PlayerGroup.listplayerbyuidCall.playerid(
            (apiResultp0p?.jsonBody ?? ''),
          ),
      );
    });
    dtPLAYERTEAM = await actions.dtTEAM(
      PlayerGroup.listplayerbyuidCall.playerteam(
        (apiResultp0p?.jsonBody ?? ''),
      ),
    );
    FFAppState().update(() {
      FFAppState().authPlayerTeamList =
          dtPLAYERTEAM!.toList().cast<TeamStruct>();
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
  await action_blocks.upadateAuthUserDataValues(context);
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
