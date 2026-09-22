import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/flutter_flow/ff_builtin_enums.dart';

bool validarCPF(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return false;
  }

  // Remove caracteres especiais da máscara (. e -)
  String limpo = cpf.replaceAll(RegExp(r'[^0-9]'), '');

  // O CPF deve conter exatamente 11 dígitos
  if (limpo.length != 11) {
    return false;
  }

  // Rejeita padrões conhecidos com todos os números iguais (ex: 111.111.111-11)
  if (RegExp(r'^(\d)\1{10}$').hasMatch(limpo)) {
    return false;
  }

  // Cálculo de validação do primeiro dígito verificador
  int soma1 = 0;
  for (int i = 0; i < 9; i++) {
    soma1 += int.parse(limpo[i]) * (10 - i);
  }
  int resto1 = (soma1 * 10) % 11;
  if (resto1 == 10 || resto1 == 11) resto1 = 0;
  if (resto1 != int.parse(limpo[9])) {
    return false;
  }

  // Cálculo de validação do segundo dígito verificador
  int soma2 = 0;
  for (int i = 0; i < 10; i++) {
    soma2 += int.parse(limpo[i]) * (11 - i);
  }
  int resto2 = (soma2 * 10) % 11;
  if (resto2 == 10 || resto2 == 11) resto2 = 0;
  if (resto2 != int.parse(limpo[10])) {
    return false;
  }

  return true;
}
