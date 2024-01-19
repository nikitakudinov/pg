import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';

Future countriesloader(BuildContext context) async {
  ApiCallResponse? jsonCOUNTRIES;

  jsonCOUNTRIES = await CountryGroup.countriesCall.call();
  FFAppState().updateMAINDATAStruct(
    (e) => e
      ..countries = ((jsonCOUNTRIES?.jsonBody ?? '')
              .toList()
              .map<CountrieStruct?>(CountrieStruct.maybeFromMap)
              .toList() as Iterable<CountrieStruct?>)
          .withoutNulls
          .toList(),
  );
}

Future notificationsupdater(BuildContext context) async {
  ApiCallResponse? jsonNOTIFICATIONS;

  jsonNOTIFICATIONS = await MessagingGroup.gETuserNotificationsCall.call(
    authUser: currentUserUid,
  );
  if ((jsonNOTIFICATIONS?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().updateMAINDATAStruct(
        (e) => e
          ..notifications = ((jsonNOTIFICATIONS?.jsonBody ?? '')
                  .toList()
                  .map<NotificationStruct?>(NotificationStruct.maybeFromMap)
                  .toList() as Iterable<NotificationStruct?>)
              .withoutNulls
              .toList(),
      );
    });
  }
}

Future onlineStatesUpdater(BuildContext context) async {
  await PlayersTable().update(
    data: {
      'player_online': true,
      'player_update_at': supaSerialize<DateTime>(getCurrentTimestamp),
    },
    matchingRows: (rows) => rows.eq(
      'player_uid',
      currentUserUid,
    ),
  );
}

Future sandAlertToTeamAdmins(BuildContext context) async {}

Future loadALLplayers(BuildContext context) async {
  ApiCallResponse? jsonPLAYERS;

  jsonPLAYERS = await PlayerGroup.listplayersCall.call();
  if ((jsonPLAYERS?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().updateMAINDATAStruct(
        (e) => e
          ..players = ((jsonPLAYERS?.jsonBody ?? '')
                  .toList()
                  .map<PlayerStruct?>(PlayerStruct.maybeFromMap)
                  .toList() as Iterable<PlayerStruct?>)
              .withoutNulls
              .toList(),
      );
    });
  }
}

Future teamsloader(BuildContext context) async {
  ApiCallResponse? apiResult8y51;

  apiResult8y51 = await TeamGroup.listallteamsCall.call();
  if ((apiResult8y51?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().updateMAINDATAStruct(
        (e) => e
          ..teams = ((apiResult8y51?.jsonBody ?? '')
                  .toList()
                  .map<TeamStruct?>(TeamStruct.maybeFromMap)
                  .toList() as Iterable<TeamStruct?>)
              .withoutNulls
              .toList(),
      );
      FFAppState().updateCOUNTERSStruct(
        (e) => e..teamslastupdatetime = getCurrentTimestamp.toString(),
      );
    });
  }
}

Future teamsupdater(BuildContext context) async {
  ApiCallResponse? jsonUPDATERDTEAMScount;

  jsonUPDATERDTEAMScount = await TeamGroup.uPDATEDTEAMScountCall.call(
    time: FFAppState().COUNTERS.teamslastupdatetime,
  );
  FFAppState().update(() {
    FFAppState().updateCOUNTERSStruct(
      (e) => e
        ..updatedteams = TeamGroup.uPDATEDTEAMScountCall.count(
          (jsonUPDATERDTEAMScount?.jsonBody ?? ''),
        ),
    );
  });
}

Future matchesloader(BuildContext context) async {
  ApiCallResponse? jsonMATCHES;

  jsonMATCHES = await MatchGroup.matchesCall.call();
  if ((jsonMATCHES?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().updateMAINDATAStruct(
        (e) => e
          ..matches = ((jsonMATCHES?.jsonBody ?? '')
                  .toList()
                  .map<MatchStruct?>(MatchStruct.maybeFromMap)
                  .toList() as Iterable<MatchStruct?>)
              .withoutNulls
              .toList(),
      );
    });
  }
}

Future tournamentsloader(BuildContext context) async {
  ApiCallResponse? jsonTOURNAMENTS;

  jsonTOURNAMENTS = await TournamentGroup.tournamentsCall.call();
  if ((jsonTOURNAMENTS?.succeeded ?? true)) {
    FFAppState().update(() {
      FFAppState().MAINDATA = MaindataStruct();
    });
    FFAppState().update(() {
      FFAppState().updateMAINDATAStruct(
        (e) => e
          ..tournaments = ((jsonTOURNAMENTS?.jsonBody ?? '')
                  .toList()
                  .map<TournamentStruct?>(TournamentStruct.maybeFromMap)
                  .toList() as Iterable<TournamentStruct?>)
              .withoutNulls
              .toList(),
      );
    });
  }
}

Future authplayerloader(BuildContext context) async {
  ApiCallResponse? jsonAUTRHPLAYER;

  jsonAUTRHPLAYER = await PlayerGroup.listplayerbyuidCall.call(
    idList: currentUserUid,
  );
  FFAppState().update(() {
    FFAppState().AUTHPLAYER = ((jsonAUTRHPLAYER?.jsonBody ?? '')
            .toList()
            .map<PlayerStruct?>(PlayerStruct.maybeFromMap)
            .toList() as Iterable<PlayerStruct?>)
        .withoutNulls[0];
  });
}

Future chatsloader(BuildContext context) async {
  ApiCallResponse? apiResulthok;

  apiResulthok = await MessagingGroup.getuserchatsCall.call(
    authUser: currentUserUid,
  );
  if ((apiResulthok?.succeeded ?? true)) {
    FFAppState().updateMAINDATAStruct(
      (e) => e..chats = [],
    );
    FFAppState().update(() {
      FFAppState().updateMAINDATAStruct(
        (e) => e
          ..chats = (getJsonField(
            (apiResulthok?.jsonBody ?? ''),
            r'''$''',
            true,
          )!
                  .toList()
                  .map<ChatStruct?>(ChatStruct.maybeFromMap)
                  .toList() as Iterable<ChatStruct?>)
              .withoutNulls
              .toList(),
      );
    });
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Нет данных с сервера'),
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

Future maindataloader(BuildContext context) async {
  ApiCallResponse? jsonAUTRHPLAYER;
  ApiCallResponse? jsonTEAMS;
  ApiCallResponse? jsonCOUNTRIES;
  ApiCallResponse? jsonPLAYERS;
  ApiCallResponse? jsonTOURNAMENTS;
  ApiCallResponse? jsonMATCHES;
  ApiCallResponse? jsonCHATS;
  ApiCallResponse? jsonTOURNAMENSTMEMBERS;
  ApiCallResponse? jsonNOTIFICATIONS;

  jsonAUTRHPLAYER = await PlayerGroup.listplayerbyuidCall.call(
    idList: currentUserUid,
  );
  jsonTEAMS = await TeamGroup.listallteamsCall.call();
  jsonCOUNTRIES = await CountryGroup.countriesCall.call();
  jsonPLAYERS = await PlayerGroup.listplayersCall.call();
  jsonTOURNAMENTS = await TournamentGroup.tournamentsCall.call();
  jsonMATCHES = await MatchGroup.matchesCall.call();
  jsonCHATS = await MessagingGroup.getuserchatsCall.call(
    authUser: currentUserUid,
  );
  jsonTOURNAMENSTMEMBERS = await TournamentGroup.tOURNAMENTMEMBERallCall.call();
  jsonNOTIFICATIONS = await MessagingGroup.gETuserNotificationsCall.call(
    authUser: currentUserUid,
  );
  FFAppState().MAINDATA = MaindataStruct();
  FFAppState().update(() {
    FFAppState().updateMAINDATAStruct(
      (e) => e
        ..players = ((jsonPLAYERS?.jsonBody ?? '')
                .toList()
                .map<PlayerStruct?>(PlayerStruct.maybeFromMap)
                .toList() as Iterable<PlayerStruct?>)
            .withoutNulls
            .toList()
        ..teams = ((jsonTEAMS?.jsonBody ?? '')
                .toList()
                .map<TeamStruct?>(TeamStruct.maybeFromMap)
                .toList() as Iterable<TeamStruct?>)
            .withoutNulls
            .toList()
        ..matches = ((jsonMATCHES?.jsonBody ?? '')
                .toList()
                .map<MatchStruct?>(MatchStruct.maybeFromMap)
                .toList() as Iterable<MatchStruct?>)
            .withoutNulls
            .toList()
        ..tournaments = ((jsonTOURNAMENTS?.jsonBody ?? '')
                .toList()
                .map<TournamentStruct?>(TournamentStruct.maybeFromMap)
                .toList() as Iterable<TournamentStruct?>)
            .withoutNulls
            .toList()
        ..countries = ((jsonCOUNTRIES?.jsonBody ?? '')
                .toList()
                .map<CountrieStruct?>(CountrieStruct.maybeFromMap)
                .toList() as Iterable<CountrieStruct?>)
            .withoutNulls
            .toList()
        ..chats = ((jsonCHATS?.jsonBody ?? '')
                .toList()
                .map<ChatStruct?>(ChatStruct.maybeFromMap)
                .toList() as Iterable<ChatStruct?>)
            .withoutNulls
            .toList()
        ..notifications = ((jsonNOTIFICATIONS?.jsonBody ?? '')
                .toList()
                .map<NotificationStruct?>(NotificationStruct.maybeFromMap)
                .toList() as Iterable<NotificationStruct?>)
            .withoutNulls
            .toList()
        ..authplayer =
            PlayerStruct.maybeFromMap((jsonAUTRHPLAYER?.jsonBody ?? ''))
        ..tournamentMembers = ((jsonTOURNAMENSTMEMBERS?.jsonBody ?? '')
                .toList()
                .map<TournamentMemberStruct?>(
                    TournamentMemberStruct.maybeFromMap)
                .toList() as Iterable<TournamentMemberStruct?>)
            .withoutNulls
            .toList(),
    );
  });
}
