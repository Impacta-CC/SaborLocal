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

class EnviarCodigoVerificacaoCall {
  static Future<ApiCallResponse> call({
    String? to = 'seu e-mail de teste',
    String? from = 'seu e-mail validado no Sendgrid',
    String? subject = 'Código de Verificação',
    String? content = '12345',
  }) async {
    final ffApiRequestBody = '''
{
  "to": ${to == null ? 'null' : '"${escapeStringForJson(to)}"'},
  "from": ${from == null ? 'null' : '"${escapeStringForJson(from)}"'},
  "subject": ${subject == null ? 'null' : '"${escapeStringForJson(subject)}"'},
  "content": ${content == null ? 'null' : '"${escapeStringForJson(content)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarCodigoVerificacao',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:jfZ30hOo/SendGrid_email',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CadastrarClienteCall {
  static Future<ApiCallResponse> call({
    String? nome = '',
    String? email = '',
    String? senha = '',
    String? cpf = '',
    String? celular = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": ${nome == null ? 'null' : '"${escapeStringForJson(nome)}"'},
  "email": ${email == null ? 'null' : '"${escapeStringForJson(email)}"'},
  "password": ${senha == null ? 'null' : '"${escapeStringForJson(senha)}"'},
  "cpf": ${cpf == null ? 'null' : '"${escapeStringForJson(cpf)}"'},
  "celular": ${celular == null ? 'null' : '"${escapeStringForJson(celular)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CadastrarCliente',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:p9wcfAQF/auth/signup',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? authToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.authToken''',
      ));
  static dynamic? userId(dynamic response) => getJsonField(
        response,
        r'''$.user_id''',
      );
}

class AtualizarStatusClienteCall {
  static Future<ApiCallResponse> call({
    int? userId,
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": ${userId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AtualizarStatusCliente',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:jfZ30hOo/verificar_cliente',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": ${email == null ? 'null' : '"${escapeStringForJson(email)}"'},
  "password": ${password == null ? 'null' : '"${escapeStringForJson(password)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:p9wcfAQF/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? authToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.authToken''',
      ));
}

class GetPerfilCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetPerfil',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:p9wcfAQF/auth/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
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

  static String? rua(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.endereco.logradouro''',
      ));
  static String? numero(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.endereco.numero''',
      ));
  static String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.cliente.nome''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.endereco.bairro''',
      ));
}

class CadastraEnderecoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? rua = '',
    String? numero = '',
    String? bairro = '',
    String? complemento = '',
    String? cep = '',
    String? referencia = '',
  }) async {
    final ffApiRequestBody = '''
{
  "rua": ${rua == null ? 'null' : '"${escapeStringForJson(rua)}"'},
  "numero": ${numero == null ? 'null' : '"${escapeStringForJson(numero)}"'},
  "bairro": ${bairro == null ? 'null' : '"${escapeStringForJson(bairro)}"'},
  "complemento": ${complemento == null ? 'null' : '"${escapeStringForJson(complemento)}"'},
  "cep": ${cep == null ? 'null' : '"${escapeStringForJson(cep)}"'},
  "referencia": ${referencia == null ? 'null' : '"${escapeStringForJson(referencia)}"'}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CadastraEndereco',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:jfZ30hOo/cadastrar_endereco',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
