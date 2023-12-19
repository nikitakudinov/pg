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
      alwaysAllowBody: false,
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
  List<String>? playerteamrole(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
    );
  }

  List<String>? playercreatedat(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playernickname(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_nickname''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playertag(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_tag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playerflag(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_flag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playercountrie(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_countrie''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playeravatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playeruid(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_uid''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? playerteam(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<String>? playerteamrole(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? playerid(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<bool>? playerteamlineup(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_lineup''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<bool>();
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
      alwaysAllowBody: false,
    );
  }

  List<String>? playercreatedat(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playernickname(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_nickname''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playertag(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_tag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playerflag(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_flag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playercountrie(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_countrie''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playeravatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playeruid(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_uid''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? playerteam(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<String>? playerteamrole(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? playerid(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<bool>? playerteamlineup(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_lineup''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<bool>();
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
      alwaysAllowBody: false,
    );
  }

  List<String>? playercreatedat(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playernickname(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_nickname''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playertag(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_tag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playerflag(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_flag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playercountrie(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_countrie''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playeravatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playeruid(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_uid''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? playerteam(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<String>? playerteamrole(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? playerid(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<bool>? playerteamlineup(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_lineup''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<bool>();
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
      alwaysAllowBody: false,
    );
  }

  List<String>? playercreatedat(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playernickname(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_nickname''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playertag(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_tag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playerflag(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_flag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playercountrie(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_countrie''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playeravatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playeruid(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_uid''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? playerteam(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<String>? playerteamrole(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? playerid(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<bool>? playerteamlineup(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_lineup''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<bool>();
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
      alwaysAllowBody: false,
    );
  }

  List<String>? playercreatedat(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playernickname(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_nickname''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playertag(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_tag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playerflag(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_flag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playercountrie(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_countrie''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playeravatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? playeruid(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_uid''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? playerteam(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<String>? playerteamrole(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_role''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? playerid(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<bool>? playerteamlineup(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_team_lineup''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<bool>();
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
    );
  }

  List? flagLinkH24(dynamic response) => getJsonField(
        response,
        r'''$[:].FlagLinkH24''',
        true,
      ) as List?;
  List? flagLink32x24(dynamic response) => getJsonField(
        response,
        r'''$[:].FlagLink32x24''',
        true,
      ) as List?;
  List? flagLink48x36(dynamic response) => getJsonField(
        response,
        r'''$[:].FlagLink48x36''',
        true,
      ) as List?;
  List? flagLink16x12(dynamic response) => getJsonField(
        response,
        r'''$[:].FlagLink16x12''',
        true,
      ) as List?;
  List? ruName(dynamic response) => getJsonField(
        response,
        r'''$[:].RuName''',
        true,
      ) as List?;
  List? enName(dynamic response) => getJsonField(
        response,
        r'''$[:].EnName''',
        true,
      ) as List?;
  List? iso2(dynamic response) => getJsonField(
        response,
        r'''$[:].Iso2''',
        true,
      ) as List?;
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
    );
  }

  List<String>? teamcreatedat(dynamic response) => (getJsonField(
        response,
        r'''$[:].team_created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? teamnam(dynamic response) => (getJsonField(
        response,
        r'''$[:].team_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? teamtag(dynamic response) => (getJsonField(
        response,
        r'''$[:].team_tag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? teamflag(dynamic response) => (getJsonField(
        response,
        r'''$[:].team_flag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? teamcountry(dynamic response) => (getJsonField(
        response,
        r'''$[:].team_country''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? teamlogo(dynamic response) => (getJsonField(
        response,
        r'''$[:].team_logo''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? teamid(dynamic response) => (getJsonField(
        response,
        r'''$[:].team_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List? teamupdatedat(dynamic response) => getJsonField(
        response,
        r'''$[:].team_updated_at''',
        true,
      ) as List?;
  List? teamcreator(dynamic response) => getJsonField(
        response,
        r'''$[:].team_creator''',
        true,
      ) as List?;
  List? teamrecruitment(dynamic response) => getJsonField(
        response,
        r'''$[:].team_recruitment''',
        true,
      ) as List?;
  List? teamstatus(dynamic response) => getJsonField(
        response,
        r'''$[:].team_status''',
        true,
      ) as List?;
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
  List<String>? createdat(dynamic response) => (getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? nickname(dynamic response) => (getJsonField(
        response,
        r'''$[:].nickname''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? uid(dynamic response) => (getJsonField(
        response,
        r'''$[:].uid''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? email(dynamic response) => (getJsonField(
        response,
        r'''$[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? tag(dynamic response) => (getJsonField(
        response,
        r'''$[:].tag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
}

/// End TEAM Group Code

/// Start TOURNAMENT Group Code

class TournamentGroup {
  static String baseUrl = 'https://supabase.proplayclub.ru/rest/v1/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
  };
  static TournamentbycreatorCall tournamentbycreatorCall =
      TournamentbycreatorCall();
  static TournamentsCall tournamentsCall = TournamentsCall();
  static TournamentmembersCall tournamentmembersCall = TournamentmembersCall();
  static TournamentmembersaCall tournamentmembersaCall =
      TournamentmembersaCall();
}

class TournamentbycreatorCall {
  Future<ApiCallResponse> call({
    String? authUser = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TOURNAMENTBYCREATOR',
      apiUrl:
          '${TournamentGroup.baseUrl}tournaments?tournament_creator=eq.${authUser}',
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
      alwaysAllowBody: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_id''',
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_created_at''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_name''',
      );
  dynamic tag(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_tag''',
      );
  dynamic flag(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_flag''',
      );
  dynamic country(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_country''',
      );
  dynamic creator(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_creator''',
      );
}

class TournamentsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'TOURNAMENTS',
      apiUrl:
          '${TournamentGroup.baseUrl}tournaments?select=*,tournament_members:teams(*)',
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
      alwaysAllowBody: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_id''',
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_created_at''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_name''',
      );
  dynamic tag(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_tag''',
      );
  dynamic flag(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_flag''',
      );
  dynamic country(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_country''',
      );
  dynamic creator(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_creator''',
      );
}

class TournamentmembersCall {
  Future<ApiCallResponse> call({
    String? tournamentID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TOURNAMENTMEMBERS',
      apiUrl:
          '${TournamentGroup.baseUrl}tournament_members?tournament_id=eq.${tournamentID}&select=teams(*)',
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
      alwaysAllowBody: false,
    );
  }

  List? teamsteamid(dynamic response) => getJsonField(
        response,
        r'''$[:].teams.team_id''',
        true,
      ) as List?;
}

class TournamentmembersaCall {
  Future<ApiCallResponse> call({
    String? tournamentID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TOURNAMENTMEMBERSA',
      apiUrl: '${TournamentGroup.baseUrl}tournaments?select=teams(*)',
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
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].tournament_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_created_at''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_name''',
      );
  dynamic tag(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_tag''',
      );
  dynamic flag(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_flag''',
      );
  dynamic country(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_country''',
      );
  dynamic creator(dynamic response) => getJsonField(
        response,
        r'''$[:].tournament_creator''',
      );
}

/// End TOURNAMENT Group Code

/// Start MATCH Group Code

class MatchGroup {
  static String baseUrl = 'https://supabase.proplayclub.ru/rest/v1/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
  };
  static MatchesCall matchesCall = MatchesCall();
  static TournamentmatchesCall tournamentmatchesCall = TournamentmatchesCall();
}

class MatchesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'MATCHES',
      apiUrl:
          '${MatchGroup.baseUrl}matches?select=*,match_rival1:teams!matches_match_rival1_fkey(*),match_rival2:teams!matches_match_rival2_fkey(*),match_for_tournament:tournaments(*)',
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
      alwaysAllowBody: false,
    );
  }

  List<int>? matchid(dynamic response) => (getJsonField(
        response,
        r'''$[:].match_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List? matchplanneddate(dynamic response) => getJsonField(
        response,
        r'''$[:].match_planned_date''',
        true,
      ) as List?;
  List<String>? matchdate(dynamic response) => (getJsonField(
        response,
        r'''$[:].match_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? matchtournamentround(dynamic response) => (getJsonField(
        response,
        r'''$[:].match_tournament_round''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<int>? matchtournamentpair(dynamic response) => (getJsonField(
        response,
        r'''$[:].match_tournament_pair''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List? matchrival1(dynamic response) => getJsonField(
        response,
        r'''$[:].match_rival1''',
        true,
      ) as List?;
  List? matchrival2(dynamic response) => getJsonField(
        response,
        r'''$[:].match_rival2''',
        true,
      ) as List?;
  List? matchfortournament(dynamic response) => getJsonField(
        response,
        r'''$[:].match_for_tournament''',
        true,
      ) as List?;
  List<String>? matchstatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].match_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List? matchrefery(dynamic response) => getJsonField(
        response,
        r'''$[:].match_refery''',
        true,
      ) as List?;
}

class TournamentmatchesCall {
  Future<ApiCallResponse> call({
    int? tournamentID,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TOURNAMENTMATCHES',
      apiUrl:
          '${MatchGroup.baseUrl}matches?match_for_tournament=eq.${tournamentID}&select=*,match_rival1:teams!matches_match_rival1_fkey(*),match_rival2:teams!matches_match_rival2_fkey(*),match_for_tournament:tournaments(*)',
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
      alwaysAllowBody: false,
    );
  }

  List<int>? matchid(dynamic response) => (getJsonField(
        response,
        r'''$[:].match_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List? matchplanneddate(dynamic response) => getJsonField(
        response,
        r'''$[:].match_planned_date''',
        true,
      ) as List?;
  List<String>? matchdate(dynamic response) => (getJsonField(
        response,
        r'''$[:].match_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? matchtournamentround(dynamic response) => (getJsonField(
        response,
        r'''$[:].match_tournament_round''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List<int>? matchtournamentpair(dynamic response) => (getJsonField(
        response,
        r'''$[:].match_tournament_pair''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List? matchrival1(dynamic response) => getJsonField(
        response,
        r'''$[:].match_rival1''',
        true,
      ) as List?;
  List? matchrival2(dynamic response) => getJsonField(
        response,
        r'''$[:].match_rival2''',
        true,
      ) as List?;
  List? matchfortournament(dynamic response) => getJsonField(
        response,
        r'''$[:].match_for_tournament''',
        true,
      ) as List?;
  List<String>? matchstatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].match_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List? matchrefery(dynamic response) => getJsonField(
        response,
        r'''$[:].match_refery''',
        true,
      ) as List?;
}

/// End MATCH Group Code

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
  static GetchatmessagesCall getchatmessagesCall = GetchatmessagesCall();
  static GetallundreadedchatmessagesCall getallundreadedchatmessagesCall =
      GetallundreadedchatmessagesCall();
  static GEToneUNDREADEDCHATMESSAGESCall gEToneUNDREADEDCHATMESSAGESCall =
      GEToneUNDREADEDCHATMESSAGESCall();
  static GETUNDREADEDCHATMESSAGEScountCall gETUNDREADEDCHATMESSAGEScountCall =
      GETUNDREADEDCHATMESSAGEScountCall();
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
      alwaysAllowBody: false,
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
  List? chatmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_members''',
        true,
      ) as List?;
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
          '${MessagingGroup.baseUrl}chat_members?player_uid=${authUser}select=chats(*)',
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
      alwaysAllowBody: false,
    );
  }

  List? chats(dynamic response) => getJsonField(
        response,
        r'''$[:].chats''',
        true,
      ) as List?;
  List? chatsmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chats.members''',
        true,
      ) as List?;
  List? chatscountofmessages(dynamic response) => getJsonField(
        response,
        r'''$[:].chats.count_of_messages''',
        true,
      ) as List?;
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
  List<String>? chatmembers(dynamic response) => (getJsonField(
        response,
        r'''$[:].chat_members''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  dynamic chatlastmessage(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_last_message''',
      );
  dynamic chatofteam(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_of_team''',
      );
  List? members(dynamic response) => getJsonField(
        response,
        r'''$[:].members''',
        true,
      ) as List?;
  List<String>? membersplayercreatedat(dynamic response) => (getJsonField(
        response,
        r'''$[:].members[:].player_created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? membersplayernickname(dynamic response) => (getJsonField(
        response,
        r'''$[:].members[:].player_nickname''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? membersplayertag(dynamic response) => (getJsonField(
        response,
        r'''$[:].members[:].player_tag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? membersplayerflag(dynamic response) => (getJsonField(
        response,
        r'''$[:].members[:].player_flag''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? membersplayercountrie(dynamic response) => (getJsonField(
        response,
        r'''$[:].members[:].player_countrie''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? membersplayeravatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].members[:].player_avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<String>? membersplayeruid(dynamic response) => (getJsonField(
        response,
        r'''$[:].members[:].player_uid''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List<int>? membersplayerteam(dynamic response) => (getJsonField(
        response,
        r'''$[:].members[:].player_team''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List? membersplayerteamrole(dynamic response) => getJsonField(
        response,
        r'''$[:].members[:].player_team_role''',
        true,
      ) as List?;
  List<bool>? membersplayerteamlineup(dynamic response) => (getJsonField(
        response,
        r'''$[:].members[:].player_team_lineup''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<bool>();
  List<int>? membersplayerid(dynamic response) => (getJsonField(
        response,
        r'''$[:].members[:].player_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
}

class GetchatmessagesCall {
  Future<ApiCallResponse> call({
    String? chatId = '',
    String? authUserUID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETCHATMESSAGES',
      apiUrl:
          '${MessagingGroup.baseUrl}message?and=(message_chat.eq.${chatId})&select=*,message_readed(*)',
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
      alwaysAllowBody: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class GetallundreadedchatmessagesCall {
  Future<ApiCallResponse> call({
    String? chatId = '',
    String? authUserUID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETALLUNDREADEDCHATMESSAGES',
      apiUrl:
          '${MessagingGroup.baseUrl}message?and=(message_chat.eq.${chatId},message_readedBy.not.cs.{${authUserUID}})&select=*,message_readed(*)',
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
      alwaysAllowBody: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class GEToneUNDREADEDCHATMESSAGESCall {
  Future<ApiCallResponse> call({
    String? chatId = '',
    String? authUserUID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GEToneUNDREADEDCHATMESSAGES',
      apiUrl:
          '${MessagingGroup.baseUrl}message?and=(message_chat.eq.${chatId},message_readedBy.not.cs.{${authUserUID}})&select=*,message_readed(*)&limit=1',
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
      alwaysAllowBody: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
      );
}

class GETUNDREADEDCHATMESSAGEScountCall {
  Future<ApiCallResponse> call({
    String? chatId = '',
    String? authUserUID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETUNDREADEDCHATMESSAGEScount',
      apiUrl:
          '${MessagingGroup.baseUrl}message?and=(message_chat.eq.${chatId},message_readedBy.not.cs.{${authUserUID}})&select=count',
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
      alwaysAllowBody: false,
    );
  }

  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$[:].count''',
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
    );
  }

  List? chatschatmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chats.chat_members''',
        true,
      ) as List?;
  dynamic chatschatmembersmember(dynamic response) => getJsonField(
        response,
        r'''$[:].chats.chat_members[:].member''',
      );
  List? chats(dynamic response) => getJsonField(
        response,
        r'''$[:].chats''',
        true,
      ) as List?;
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
      alwaysAllowBody: false,
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
      alwaysAllowBody: false,
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
  List? chatmembers(dynamic response) => getJsonField(
        response,
        r'''$[:].chat_members''',
        true,
      ) as List?;
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
