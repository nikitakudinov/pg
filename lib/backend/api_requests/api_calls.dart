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
  static ListplayerbyidCall listplayerbyidCall = ListplayerbyidCall();
  static ListplayersCall listplayersCall = ListplayersCall();
}

class ListplayerbyuidCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTPLAYERBYUID',
      apiUrl: '${PlayerGroup.baseUrl}players?player_uid=eq.${idList}',
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
      );
  dynamic playerid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_id''',
      );
  dynamic playerteamlineup(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_lineup''',
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
      );
  dynamic playerid(dynamic response) => getJsonField(
        response,
        r'''$[:].player_id''',
      );
  dynamic playerteamlineup(dynamic response) => getJsonField(
        response,
        r'''$[:].player_team_lineup''',
      );
}

class ListplayersCall {
  Future<ApiCallResponse> call({
    String? idList = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LISTPLAYERS',
      apiUrl: '${PlayerGroup.baseUrl}users?select=*,teams(*)',
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
