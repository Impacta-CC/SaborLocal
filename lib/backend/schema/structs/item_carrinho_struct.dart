// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemCarrinhoStruct extends BaseStruct {
  ItemCarrinhoStruct({
    int? produtoId,
    String? nome,
    double? preco,
    String? imagemUrl,
    int? quantidade,
    String? observacao,
    double? subtotal,
  })  : _produtoId = produtoId,
        _nome = nome,
        _preco = preco,
        _imagemUrl = imagemUrl,
        _quantidade = quantidade,
        _observacao = observacao,
        _subtotal = subtotal;

  // "produto_id" field.
  int? _produtoId;
  int get produtoId => _produtoId ?? 0;
  set produtoId(int? val) => _produtoId = val;

  void incrementProdutoId(int amount) => produtoId = produtoId + amount;

  bool hasProdutoId() => _produtoId != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  set preco(double? val) => _preco = val;

  void incrementPreco(double amount) => preco = preco + amount;

  bool hasPreco() => _preco != null;

  // "imagem_url" field.
  String? _imagemUrl;
  String get imagemUrl => _imagemUrl ?? '';
  set imagemUrl(String? val) => _imagemUrl = val;

  bool hasImagemUrl() => _imagemUrl != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  set quantidade(int? val) => _quantidade = val;

  void incrementQuantidade(int amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "observacao" field.
  String? _observacao;
  String get observacao => _observacao ?? '';
  set observacao(String? val) => _observacao = val;

  bool hasObservacao() => _observacao != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  set subtotal(double? val) => _subtotal = val;

  void incrementSubtotal(double amount) => subtotal = subtotal + amount;

  bool hasSubtotal() => _subtotal != null;

  static ItemCarrinhoStruct fromMap(Map<String, dynamic> data) =>
      ItemCarrinhoStruct(
        produtoId: castToType<int>(data['produto_id']),
        nome: data['nome'] as String?,
        preco: castToType<double>(data['preco']),
        imagemUrl: data['imagem_url'] as String?,
        quantidade: castToType<int>(data['quantidade']),
        observacao: data['observacao'] as String?,
        subtotal: castToType<double>(data['subtotal']),
      );

  static ItemCarrinhoStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemCarrinhoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'produto_id': _produtoId,
        'nome': _nome,
        'preco': _preco,
        'imagem_url': _imagemUrl,
        'quantidade': _quantidade,
        'observacao': _observacao,
        'subtotal': _subtotal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'produto_id': serializeParam(
          _produtoId,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'preco': serializeParam(
          _preco,
          ParamType.double,
        ),
        'imagem_url': serializeParam(
          _imagemUrl,
          ParamType.String,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.int,
        ),
        'observacao': serializeParam(
          _observacao,
          ParamType.String,
        ),
        'subtotal': serializeParam(
          _subtotal,
          ParamType.double,
        ),
      }.withoutNulls;

  static ItemCarrinhoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemCarrinhoStruct(
        produtoId: deserializeParam(
          data['produto_id'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        preco: deserializeParam(
          data['preco'],
          ParamType.double,
          false,
        ),
        imagemUrl: deserializeParam(
          data['imagem_url'],
          ParamType.String,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.int,
          false,
        ),
        observacao: deserializeParam(
          data['observacao'],
          ParamType.String,
          false,
        ),
        subtotal: deserializeParam(
          data['subtotal'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ItemCarrinhoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemCarrinhoStruct &&
        produtoId == other.produtoId &&
        nome == other.nome &&
        preco == other.preco &&
        imagemUrl == other.imagemUrl &&
        quantidade == other.quantidade &&
        observacao == other.observacao &&
        subtotal == other.subtotal;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [produtoId, nome, preco, imagemUrl, quantidade, observacao, subtotal]);
}

ItemCarrinhoStruct createItemCarrinhoStruct({
  int? produtoId,
  String? nome,
  double? preco,
  String? imagemUrl,
  int? quantidade,
  String? observacao,
  double? subtotal,
}) =>
    ItemCarrinhoStruct(
      produtoId: produtoId,
      nome: nome,
      preco: preco,
      imagemUrl: imagemUrl,
      quantidade: quantidade,
      observacao: observacao,
      subtotal: subtotal,
    );
