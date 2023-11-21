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

Future dowloadAllTeamsDataToAppState(BuildContext context) async {
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
          ..playerTeamRole = PlayerGroup.listplayerbyuidCall
              .playerteamrole(
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

Future loadAuthUserAlerts(BuildContext context) async {}

Future preloadDataOfHomePage(BuildContext context) async {
  await action_blocks.upadateAuthUserDataValues(context);
  await action_blocks.loadAuthUserChats(context);
  await action_blocks.loadAuthUserAlerts(context);
}
