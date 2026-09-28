import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ViaCEPCall {
  static Future<ApiCallResponse> call({
    String? cep = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ViaCEP',
      apiUrl: 'https://viacep.com.br/ws/${cep}/json/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? logradouro(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.logradouro''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bairro''',
      ));
  static String? uf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uf''',
      ));
  static String? cidade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.localidade''',
      ));
}

/// -------------------------------------------------------------
/// Xano Backend Integration (Daniel's Workspace)
/// -------------------------------------------------------------

class XanoAuthGroup {
  static String baseUrl = 'https://x8ki-letl-twmt.n7.xano.io/api:p9wcfAQF';
  static XanoSignupCall signupCall = XanoSignupCall();
  static XanoLoginCall loginCall = XanoLoginCall();
  static XanoMeCall meCall = XanoMeCall();
  static XanoRequestResetLinkCall requestResetLinkCall =
      XanoRequestResetLinkCall();
}

class XanoSignupCall {
  Future<ApiCallResponse> call({
    String? name,
    String? email,
    String? password,
  }) async {
    final body = json.encode({
      if (name != null && name.isNotEmpty) 'name': name,
      if (email != null && email.isNotEmpty) 'email': email,
      if (password != null && password.isNotEmpty) 'password': password,
    });
    return ApiManager.instance.makeApiCall(
      callName: 'XanoSignup',
      apiUrl: '${XanoAuthGroup.baseUrl}/auth/signup',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? authToken(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('authToken')) {
      return body['authToken']?.toString();
    }
    return castToType<String>(getJsonField(
      response,
      r'''$.authToken''',
    ));
  }

  static int? userId(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('user_id')) {
      return castToType<int>(body['user_id']);
    }
    return castToType<int>(getJsonField(
      response,
      r'''$.user_id''',
    ));
  }

  static String? errorMessage(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('message')) {
      return body['message']?.toString();
    }
    return castToType<String>(getJsonField(
      response,
      r'''$.message''',
    ));
  }
}

class XanoLoginCall {
  Future<ApiCallResponse> call({
    String? email,
    String? password,
  }) async {
    final body = json.encode({
      if (email != null && email.isNotEmpty) 'email': email,
      if (password != null && password.isNotEmpty) 'password': password,
    });
    return ApiManager.instance.makeApiCall(
      callName: 'XanoLogin',
      apiUrl: '${XanoAuthGroup.baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? authToken(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('authToken')) {
      return body['authToken']?.toString();
    }
    return castToType<String>(getJsonField(
      response,
      r'''$.authToken''',
    ));
  }

  static int? userId(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('user_id')) {
      return castToType<int>(body['user_id']);
    }
    return castToType<int>(getJsonField(
      response,
      r'''$.user_id''',
    ));
  }

  static String? errorMessage(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('message')) {
      return body['message']?.toString();
    }
    return castToType<String>(getJsonField(
      response,
      r'''$.message''',
    ));
  }
}

class XanoMeCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'XanoMe',
      apiUrl: '${XanoAuthGroup.baseUrl}/auth/me',
      callType: ApiCallType.GET,
      headers: {
        if (authToken != null && authToken.isNotEmpty)
          'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('id')) {
      return castToType<int>(body['id']);
    }
    return castToType<int>(getJsonField(response, r'''$.id'''));
  }

  static String? name(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('name')) {
      return body['name']?.toString();
    }
    return castToType<String>(getJsonField(response, r'''$.name'''));
  }

  static String? email(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('email')) {
      return body['email']?.toString();
    }
    return castToType<String>(getJsonField(response, r'''$.email'''));
  }

  static String? role(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('role')) {
      return body['role']?.toString();
    }
    return castToType<String>(getJsonField(response, r'''$.role'''));
  }

  static int? createdAt(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('created_at')) {
      return castToType<int>(body['created_at']);
    }
    return castToType<int>(getJsonField(response, r'''$.created_at'''));
  }
}

class XanoRequestResetLinkCall {
  Future<ApiCallResponse> call({
    String? email,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'XanoRequestResetLink',
      apiUrl: '${XanoAuthGroup.baseUrl}/reset/request-reset-link',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        if (email != null && email.isNotEmpty) 'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is Map && body.containsKey('message')) {
      final msg = body['message'];
      if (msg is Map && msg.containsKey('message')) {
        return msg['message']?.toString();
      }
      return msg?.toString();
    }
    return castToType<String>(getJsonField(response, r'''$.message.message'''));
  }
}

class XanoEventLogsGroup {
  static String baseUrl = 'https://x8ki-letl-twmt.n7.xano.io/api:PZJnI3lY';
  static XanoMyEventsCall myEventsCall = XanoMyEventsCall();
}

class XanoMyEventsCall {
  Future<ApiCallResponse> call({
    String? authToken,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'XanoMyEvents',
      apiUrl: '${XanoEventLogsGroup.baseUrl}/logs/user/my_events',
      callType: ApiCallType.GET,
      headers: {
        if (authToken != null && authToken.isNotEmpty)
          'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? events(dynamic response) {
    final body = response is ApiCallResponse ? response.jsonBody : response;
    if (body is List) {
      return body;
    }
    return castToType<List>(getJsonField(response, r'''$'''));
  }
}

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

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
