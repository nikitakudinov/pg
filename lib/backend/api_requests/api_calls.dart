import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start PLAYER Group Code

class PlayerGroup {
  static String baseUrl = 'https://supabase.proplayclub.ru/rest/v1/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
    'Authorization':
        'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
  };
  static ListplayerbyuidCall listplayerbyuidCall = ListplayerbyuidCall();
  static AuthplayerupdatedCall authplayerupdatedCall = AuthplayerupdatedCall();
  static ListplayerbyidCall listplayerbyidCall = ListplayerbyidCall();
  static LISTPLAYERBYTEAMandTEAMROLECall lISTPLAYERBYTEAMandTEAMROLECall =
      LISTPLAYERBYTEAMandTEAMROLECall();
  static LISTPLAYERBYTEAMandTEAMROIDCall lISTPLAYERBYTEAMandTEAMROIDCall =
      LISTPLAYERBYTEAMandTEAMROIDCall();
  static LISTPLAYERBYTEAMandTEAMROLEcountCall
      lISTPLAYERBYTEAMandTEAMROLEcountCall =
      LISTPLAYERBYTEAMandTEAMROLEcountCall();
  static ListplayerbyteamCall listplayerbyteamCall = ListplayerbyteamCall();
  static ListplayersCall listplayersCall = ListplayersCall();
  static PlayersearchCall playersearchCall = PlayersearchCall();
}

class ListplayerbyuidCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTPLAYERBYUID',
      apiUrl: '${PlayerGroup.baseUrl}players?player_uid=eq.${idList}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic playercreatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].player_created_at''',
      );
  dynamic playernickname(dynamic response) => getJsonField(
        response,
        r'''$[:].player_nickname''',
      );
  dynamic playertag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_tag''',
      );
  dynamic playerflag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_flag''',
      );
  dynamic playercountrie(dynamic response) => getJsonField(
        response,
        r'''$[:].player_countrie''',
      );
  dynamic playeravatar(dynamic response) => getJsonField(
        response,
        r'''$[:].player_avatar''',
      );
  dynamic playeruid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_uid''',
      );
  dynamic playerteam(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team''',
      );
  dynamic playerteamrole(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      );
  dynamic playerid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_id''',
      );
  dynamic playerteamlineup(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_lineup''',
      );
  dynamic playerteamteamlogo(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team.team_logo''',
      );
  dynamic playeronline(dynamic response) => getJsonField(
        response,
        r'''$[:].player_online''',
      );
}

class AuthplayerupdatedCall {
  Future<ApiCallResponse> call({
    String? uid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AUTHPLAYERUPDATED',
      apiUrl:
          '${PlayerGroup.baseUrl}players?player_uid=eq.${uid}&select=player_update_at',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic playerupdateat(dynamic response) => getJsonField(
        response,
        r'''$[:].player_update_at''',
      );
}

class ListplayerbyidCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTPLAYERBYID',
      apiUrl: '${PlayerGroup.baseUrl}players?player_id=in.%28${idList}%29',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic playercreatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].player_created_at''',
        true,
      );
  dynamic playernickname(dynamic response) => getJsonField(
        response,
        r'''$[:].player_nickname''',
        true,
      );
  dynamic playertag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_tag''',
        true,
      );
  dynamic playerflag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_flag''',
        true,
      );
  dynamic playercountrie(dynamic response) => getJsonField(
        response,
        r'''$[:].player_countrie''',
        true,
      );
  dynamic playeravatar(dynamic response) => getJsonField(
        response,
        r'''$[:].player_avatar''',
        true,
      );
  dynamic playeruid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_uid''',
        true,
      );
  dynamic playerteam(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team''',
        true,
      );
  dynamic playerteamrole(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      );
  dynamic playerid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_id''',
        true,
      );
  dynamic playerteamlineup(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_lineup''',
        true,
      );
}

class LISTPLAYERBYTEAMandTEAMROLECall {
  Future<ApiCallResponse> call({
    String? playersOfTeam = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTPLAYERBYTEAMandTEAMROLE',
      apiUrl:
          '${PlayerGroup.baseUrl}players?player_team=in.%28${playersOfTeam}%29&or=(player_team_role.cs.{Основатель},player_team_role.cs.{Администратор})',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic playercreatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].player_created_at''',
        true,
      );
  dynamic playernickname(dynamic response) => getJsonField(
        response,
        r'''$[:].player_nickname''',
        true,
      );
  dynamic playertag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_tag''',
        true,
      );
  dynamic playerflag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_flag''',
        true,
      );
  dynamic playercountrie(dynamic response) => getJsonField(
        response,
        r'''$[:].player_countrie''',
        true,
      );
  dynamic playeravatar(dynamic response) => getJsonField(
        response,
        r'''$[:].player_avatar''',
        true,
      );
  dynamic playeruid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_uid''',
        true,
      );
  dynamic playerteam(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team''',
        true,
      );
  dynamic playerteamrole(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      );
  dynamic playerid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_id''',
        true,
      );
  dynamic playerteamlineup(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_lineup''',
        true,
      );
}

class LISTPLAYERBYTEAMandTEAMROIDCall {
  Future<ApiCallResponse> call({
    String? playersOfTeam = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTPLAYERBYTEAMandTEAMROID',
      apiUrl:
          '${PlayerGroup.baseUrl}players?player_team=in.%28${playersOfTeam}%29&or=(player_team_role.cs.{Основатель},player_team_role.cs.{Администратор})',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic playercreatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].player_created_at''',
        true,
      );
  dynamic playernickname(dynamic response) => getJsonField(
        response,
        r'''$[:].player_nickname''',
        true,
      );
  dynamic playertag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_tag''',
        true,
      );
  dynamic playerflag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_flag''',
        true,
      );
  dynamic playercountrie(dynamic response) => getJsonField(
        response,
        r'''$[:].player_countrie''',
        true,
      );
  dynamic playeravatar(dynamic response) => getJsonField(
        response,
        r'''$[:].player_avatar''',
        true,
      );
  dynamic playeruid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_uid''',
        true,
      );
  dynamic playerteam(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team''',
        true,
      );
  dynamic playerteamrole(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      );
  dynamic playerid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_id''',
        true,
      );
  dynamic playerteamlineup(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_lineup''',
        true,
      );
}

class LISTPLAYERBYTEAMandTEAMROLEcountCall {
  Future<ApiCallResponse> call({
    String? playersOfTeam = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTPLAYERBYTEAMandTEAMROLEcount',
      apiUrl:
          '${PlayerGroup.baseUrl}players?player_team=in.%28${playersOfTeam}%29&or=(player_team_role.cs.{Основатель},player_team_role.cs.{Администратор})&select=count',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Prefer': 'count=exact',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic playercreatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].player_created_at''',
        true,
      );
  dynamic playernickname(dynamic response) => getJsonField(
        response,
        r'''$[:].player_nickname''',
        true,
      );
  dynamic playertag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_tag''',
        true,
      );
  dynamic playerflag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_flag''',
        true,
      );
  dynamic playercountrie(dynamic response) => getJsonField(
        response,
        r'''$[:].player_countrie''',
        true,
      );
  dynamic playeravatar(dynamic response) => getJsonField(
        response,
        r'''$[:].player_avatar''',
        true,
      );
  dynamic playeruid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_uid''',
        true,
      );
  dynamic playerteam(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team''',
        true,
      );
  dynamic playerteamrole(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      );
  dynamic playerid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_id''',
        true,
      );
  dynamic playerteamlineup(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_lineup''',
        true,
      );
}

class ListplayerbyteamCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTPLAYERBYTEAM',
      apiUrl: '${PlayerGroup.baseUrl}players?player_team=in.%28${idList}%29',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic playercreatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].player_created_at''',
        true,
      );
  dynamic playernickname(dynamic response) => getJsonField(
        response,
        r'''$[:].player_nickname''',
        true,
      );
  dynamic playertag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_tag''',
        true,
      );
  dynamic playerflag(dynamic response) => getJsonField(
        response,
        r'''$[:].player_flag''',
        true,
      );
  dynamic playercountrie(dynamic response) => getJsonField(
        response,
        r'''$[:].player_countrie''',
        true,
      );
  dynamic playeravatar(dynamic response) => getJsonField(
        response,
        r'''$[:].player_avatar''',
        true,
      );
  dynamic playeruid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_uid''',
        true,
      );
  dynamic playerteam(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team''',
        true,
      );
  dynamic playerteamrole(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      );
  dynamic playerid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_id''',
        true,
      );
  dynamic playerteamlineup(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_lineup''',
        true,
      );
}

class ListplayersCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTPLAYERS',
      apiUrl: '${PlayerGroup.baseUrl}players?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PlayersearchCall {
  Future<ApiCallResponse> call({
    String? searchText = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PLAYERSEARCH',
      apiUrl:
          '${PlayerGroup.baseUrl}players?or=(player_nickname.ilike.%${searchText}%),player_tag.ilike%${searchText}%&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End PLAYER Group Code

/// Start COUNTRY Group Code

class CountryGroup {
  static String baseUrl = 'https://supabase.proplayclub.ru/rest/v1/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
    'Authorization':
        'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
  };
  static CountriesCall countriesCall = CountriesCall();
}

class CountriesCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'COUNTRIES',
      apiUrl: '${CountryGroup.baseUrl}countries?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic flagLinkH24(dynamic response) => getJsonField(
        response,
        r'''$[:].FlagLinkH24''',
        true,
      );
  dynamic flagLink32x24(dynamic response) => getJsonField(
        response,
        r'''$[:].FlagLink32x24''',
        true,
      );
  dynamic flagLink48x36(dynamic response) => getJsonField(
        response,
        r'''$[:].FlagLink48x36''',
        true,
      );
  dynamic flagLink16x12(dynamic response) => getJsonField(
        response,
        r'''$[:].FlagLink16x12''',
        true,
      );
  dynamic ruName(dynamic response) => getJsonField(
        response,
        r'''$[:].RuName''',
        true,
      );
  dynamic enName(dynamic response) => getJsonField(
        response,
        r'''$[:].EnName''',
        true,
      );
  dynamic iso2(dynamic response) => getJsonField(
        response,
        r'''$[:].Iso2''',
        true,
      );
}

/// End COUNTRY Group Code

/// Start TEAM Group Code

class TeamGroup {
  static String baseUrl = 'https://supabase.proplayclub.ru/rest/v1/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
  };
  static ListteambyidCall listteambyidCall = ListteambyidCall();
  static TeambycreatorCall teambycreatorCall = TeambycreatorCall();
  static LISTALLTEAMScountCall lISTALLTEAMScountCall = LISTALLTEAMScountCall();
  static ListallteamsCall listallteamsCall = ListallteamsCall();
}

class ListteambyidCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTTEAMBYID',
      apiUrl: '${TeamGroup.baseUrl}teams?team_id=in.%28${idList}%29',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic teamcreatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].team_created_at''',
      );
  dynamic teamnam(dynamic response) => getJsonField(
        response,
        r'''$[:].team_name''',
      );
  dynamic teamtag(dynamic response) => getJsonField(
        response,
        r'''$[:].team_tag''',
      );
  dynamic teamflag(dynamic response) => getJsonField(
        response,
        r'''$[:].team_flag''',
      );
  dynamic teamcountry(dynamic response) => getJsonField(
        response,
        r'''$[:].team_country''',
      );
  dynamic teamlogo(dynamic response) => getJsonField(
        response,
        r'''$[:].team_logo''',
      );
  dynamic teamid(dynamic response) => getJsonField(
        response,
        r'''$[:].team_id''',
      );
  dynamic teamstatus(dynamic response) => getJsonField(
        response,
        r'''$[:].team_status''',
      );
  dynamic teamcreator(dynamic response) => getJsonField(
        response,
        r'''$[:].team_creator''',
      );
  dynamic teamupdatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].team_updated_at''',
      );
  dynamic teamrecruitment(dynamic response) => getJsonField(
        response,
        r'''$[:].team_recruitment''',
      );
  dynamic teamchatid(dynamic response) => getJsonField(
        response,
        r'''$[:].team_chat_id''',
      );
}

class TeambycreatorCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TEAMBYCREATOR',
      apiUrl: '${TeamGroup.baseUrl}teams?team_creator=in.%28${idList}%29',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic teamcreatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].team_created_at''',
        true,
      );
  dynamic teamnam(dynamic response) => getJsonField(
        response,
        r'''$[:].team_name''',
        true,
      );
  dynamic teamtag(dynamic response) => getJsonField(
        response,
        r'''$[:].team_tag''',
        true,
      );
  dynamic teamflag(dynamic response) => getJsonField(
        response,
        r'''$[:].team_flag''',
        true,
      );
  dynamic teamcountry(dynamic response) => getJsonField(
        response,
        r'''$[:].team_country''',
        true,
      );
  dynamic teamlogo(dynamic response) => getJsonField(
        response,
        r'''$[:].team_logo''',
        true,
      );
  dynamic teamid(dynamic response) => getJsonField(
        response,
        r'''$[:].team_id''',
        true,
      );
  dynamic teamupdatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].team_updated_at''',
        true,
      );
  dynamic teamcreator(dynamic response) => getJsonField(
        response,
        r'''$[:].team_creator''',
        true,
      );
  dynamic teamrecruitment(dynamic response) => getJsonField(
        response,
        r'''$[:].team_recruitment''',
        true,
      );
  dynamic teamstatus(dynamic response) => getJsonField(
        response,
        r'''$[:].team_status''',
        true,
      );
}

class LISTALLTEAMScountCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTALLTEAMScount',
      apiUrl: '${TeamGroup.baseUrl}teams?select=count',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class ListallteamsCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTALLTEAMS',
      apiUrl: '${TeamGroup.baseUrl}teams?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      );
  dynamic nickname(dynamic response) => getJsonField(
        response,
        r'''$[:].nickname''',
        true,
      );
  dynamic uid(dynamic response) => getJsonField(
        response,
        r'''$[:].uid''',
        true,
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$[:].email''',
        true,
      );
  dynamic tag(dynamic response) => getJsonField(
        response,
        r'''$[:].tag''',
        true,
      );
}

/// End TEAM Group Code

/// Start TOURNAMENT Group Code

class TournamentGroup {
  static String baseUrl = 'https://supabase.proplayclub.ru/rest/v1/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNjk3NDkwMDAwLAogICJleHAiOiAxODU1MzQyODAwCn0.GstXS2E-MRDa21g3c-jN67PbXZG9Cz8spj2pjoHheJA',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNjk3NDkwMDAwLAogICJleHAiOiAxODU1MzQyODAwCn0.GstXS2E-MRDa21g3c-jN67PbXZG9Cz8spj2pjoHheJA',
  };
  static ListtournamentsCall listtournamentsCall = ListtournamentsCall();
}

class ListtournamentsCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTTOURNAMENTS',
      apiUrl: '${TournamentGroup.baseUrl}tournaments?id=in.%28${idList}%29',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNjk3NDkwMDAwLAogICJleHAiOiAxODU1MzQyODAwCn0.GstXS2E-MRDa21g3c-jN67PbXZG9Cz8spj2pjoHheJA',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNjk3NDkwMDAwLAogICJleHAiOiAxODU1MzQyODAwCn0.GstXS2E-MRDa21g3c-jN67PbXZG9Cz8spj2pjoHheJA',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      );
  dynamic nickname(dynamic response) => getJsonField(
        response,
        r'''$[:].nickname''',
      );
  dynamic uid(dynamic response) => getJsonField(
        response,
        r'''$[:].uid''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$[:].email''',
      );
  dynamic tag(dynamic response) => getJsonField(
        response,
        r'''$[:].tag''',
      );
}

/// End TOURNAMENT Group Code

/// Start MESSAGING Group Code

class MessagingGroup {
  static String baseUrl = 'https://supabase.proplayclub.ru/rest/v1/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
    'Authorization':
        'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
  };
  static ChatsCall chatsCall = ChatsCall();
  static GetchatsCall getchatsCall = GetchatsCall();
  static GETuserNotificationsCall gETuserNotificationsCall =
      GETuserNotificationsCall();
  static GETNOTIFICATIONScountCall gETNOTIFICATIONScountCall =
      GETNOTIFICATIONScountCall();
  static GetchatbyidCall getchatbyidCall = GetchatbyidCall();
  static GetundreadedchatmessagescountCall getundreadedchatmessagescountCall =
      GetundreadedchatmessagescountCall();
  static GetundreadedchatmessagesCall getundreadedchatmessagesCall =
      GetundreadedchatmessagesCall();
  static GetchatmessagesCall getchatmessagesCall = GetchatmessagesCall();
  static GETCHATMESSAGESCopyCall gETCHATMESSAGESCopyCall =
      GETCHATMESSAGESCopyCall();
  static GetunreadedmessagesCall getunreadedmessagesCall =
      GetunreadedmessagesCall();
  static GETCHATMESSAGEScountCall gETCHATMESSAGEScountCall =
      GETCHATMESSAGEScountCall();
  static GetuserchatsCall getuserchatsCall = GetuserchatsCall();
  static GETUSERCHATScountCall gETUSERCHATScountCall = GETUSERCHATScountCall();
  static ChatbyteamidCall chatbyteamidCall = ChatbyteamidCall();
}

class ChatsCall {
  Future<ApiCallResponse> call({
    String? idList = '',
    String? idList1 = '',
    int? idList2,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CHATS',
      apiUrl:
          '${MessagingGroup.baseUrl}chats?chat_members=cs.{${idList}}&chat_members=cs.{${idList1}}&chat_count_of_members=in.(${idList2})',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Prefer': 'count=exact',
        'Range-Unit': 'items',
        'Range': '0-24',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic chatid(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_id''',
      );
  dynamic chatupdatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_updated_at''',
      );
  dynamic chatmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_members''',
        true,
      );
  dynamic chatlastmessage(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_last_message''',
      );
  dynamic chatofteam(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_of_team''',
      );
  dynamic chatcountofmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_count_of_members''',
      );
}

class GetchatsCall {
  Future<ApiCallResponse> call({
    String? authUser = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETCHATS',
      apiUrl:
          '${MessagingGroup.baseUrl}chat_members?select=chats(*,messages:message(*),members:players(*),count_of_messages:message(count))&or=(player_uid.eq.${authUser})',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic chats(dynamic response) => getJsonField(
        response,
        r'''$[:].chats''',
      );
  dynamic chatsmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chats.members''',
        true,
      );
  dynamic chatscountofmessages(dynamic response) => getJsonField(
        response,
        r'''$[:].chats.count_of_messages''',
        true,
      );
}

class GETuserNotificationsCall {
  Future<ApiCallResponse> call({
    String? authUser = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETuserNotifications',
      apiUrl:
          '${MessagingGroup.baseUrl}notifications?notification_to_player=eq.${authUser}&select=*,notification_from_player:players!notifications_notification_from_player_fkey(*),notification_from_team:teams(*),notification_from_tournament:tournaments(*)',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GETNOTIFICATIONScountCall {
  Future<ApiCallResponse> call({
    String? authUser = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETNOTIFICATIONScount',
      apiUrl:
          '${MessagingGroup.baseUrl}notifications?notification_to_player=eq.${authUser}&select=count',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class GetchatbyidCall {
  Future<ApiCallResponse> call({
    String? chatID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETCHATBYID',
      apiUrl:
          '${MessagingGroup.baseUrl}chats?chat_id=eq.${chatID}&select=*,members:players(*)',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic chatid(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_id''',
      );
  dynamic chatupdatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_updated_at''',
      );
  dynamic chatmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_members''',
        true,
      );
  dynamic chatlastmessage(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_last_message''',
      );
  dynamic chatofteam(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_of_team''',
      );
  dynamic members(dynamic response) => getJsonField(
        response,
        r'''$[:].members''',
        true,
      );
  dynamic membersplayercreatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_created_at''',
        true,
      );
  dynamic membersplayernickname(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_nickname''',
        true,
      );
  dynamic membersplayertag(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_tag''',
        true,
      );
  dynamic membersplayerflag(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_flag''',
        true,
      );
  dynamic membersplayercountrie(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_countrie''',
        true,
      );
  dynamic membersplayeravatar(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_avatar''',
        true,
      );
  dynamic membersplayeruid(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_uid''',
        true,
      );
  dynamic membersplayerteam(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_team''',
        true,
      );
  dynamic membersplayerteamrole(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_team_role''',
        true,
      );
  dynamic membersplayerteamlineup(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_team_lineup''',
        true,
      );
  dynamic membersplayerid(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_id''',
        true,
      );
}

class GetundreadedchatmessagescountCall {
  Future<ApiCallResponse> call({
    String? chatId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETUNDREADEDCHATMESSAGESCOUNT',
      apiUrl:
          '${MessagingGroup.baseUrl}message?message_chat=eq.${chatId}&message_readed=eq.false&select=count',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class GetundreadedchatmessagesCall {
  Future<ApiCallResponse> call({
    String? chatId = '',
    String? authUserUID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETUNDREADEDCHATMESSAGES',
      apiUrl:
          '${MessagingGroup.baseUrl}message?message_chat=eq.${chatId}&message_readed=eq.false&message_readedBy1=cs.${authUserUID}&select=count',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class GetchatmessagesCall {
  Future<ApiCallResponse> call({
    String? chatId = '',
    String? authUserUID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETCHATMESSAGES',
      apiUrl:
          '${MessagingGroup.baseUrl}message?message_chat=eq.${chatId}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class GETCHATMESSAGESCopyCall {
  Future<ApiCallResponse> call({
    String? authUserUID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETCHATMESSAGES Copy',
      apiUrl:
          '${MessagingGroup.baseUrl}message?&select=*,message_readedBy(players(player_uid))&message_readedBy.players.player_uid=eq.${authUserUID}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class GetunreadedmessagesCall {
  Future<ApiCallResponse> call({
    String? authUserUID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETUNREADEDMESSAGES',
      apiUrl:
          '${MessagingGroup.baseUrl}message_readed?and=(player_uid.not.eq.${authUserUID})&select=message(*)',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$[:].message''',
        true,
      );
}

class GETCHATMESSAGEScountCall {
  Future<ApiCallResponse> call({
    String? chatId = '',
    String? authUserUID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETCHATMESSAGEScount',
      apiUrl:
          '${MessagingGroup.baseUrl}message?message_chat=eq.${chatId}&select=count',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Prefer': 'count=planned',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class GetuserchatsCall {
  Future<ApiCallResponse> call({
    String? authUser = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETUSERCHATS',
      apiUrl:
          '${MessagingGroup.baseUrl}chat_members?player_uid=eq.${authUser}&select=chats(*,members:players(*))',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic chatschatmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chats.chat_members''',
        true,
      );
  dynamic chatschatmembersmember(dynamic response) => getJsonField(
        response,
        r'''$[:].chats.chat_members[:].member''',
      );
  dynamic chats(dynamic response) => getJsonField(
        response,
        r'''$[:].chats''',
        true,
      );
}

class GETUSERCHATScountCall {
  Future<ApiCallResponse> call({
    String? authUser = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETUSERCHATScount',
      apiUrl:
          '${MessagingGroup.baseUrl}chats?chat_members=cs.{${authUser}}&select=count',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class ChatbyteamidCall {
  Future<ApiCallResponse> call({
    String? idList = '',
    String? idList1 = '',
    int? idList2,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CHATBYTEAMID',
      apiUrl: '${MessagingGroup.baseUrl}chats?chat_of_team=eq.${idList}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Authorization':
            'BearereyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        'Prefer': 'count=exact',
        'Range-Unit': 'items',
        'Range': '0-24',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic chatid(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_id''',
      );
  dynamic chatupdatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_updated_at''',
      );
  dynamic chatmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_members''',
        true,
      );
  dynamic chatlastmessage(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_last_message''',
      );
  dynamic chatofteam(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_of_team''',
      );
  dynamic chatcountofmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_count_of_members''',
      );
}

/// End MESSAGING Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
