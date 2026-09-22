import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'tela_registro_widget.dart' show TelaRegistroWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class TelaRegistroModel extends FlutterFlowModel<TelaRegistroWidget> {
  ///  Local state fields for this page.

  bool codigoEnviado = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txt_nome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  String? _txtNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha com seu nome';
    }

    return null;
  }

  // State field(s) for txt_email widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  String? _txtEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha com seu e-mail';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for txt_telefone widget.
  FocusNode? txtTelefoneFocusNode;
  TextEditingController? txtTelefoneTextController;
  late MaskTextInputFormatter txtTelefoneMask;
  String? Function(BuildContext, String?)? txtTelefoneTextControllerValidator;
  String? _txtTelefoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha o telefone';
    }

    if (val.length < 15) {
      return 'Quantidade de números inválida';
    }

    return null;
  }

  // State field(s) for txt_CPF widget.
  FocusNode? txtCPFFocusNode;
  TextEditingController? txtCPFTextController;
  late MaskTextInputFormatter txtCPFMask;
  String? Function(BuildContext, String?)? txtCPFTextControllerValidator;
  // State field(s) for txt_senha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaTextController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaTextControllerValidator;
  String? _txtSenhaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'É necessário ter uma senha ';
    }

    if (val.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres ';
    }

    return null;
  }

  // State field(s) for txt_confirme widget.
  FocusNode? txtConfirmeFocusNode;
  TextEditingController? txtConfirmeTextController;
  String? Function(BuildContext, String?)? txtConfirmeTextControllerValidator;
  String? _txtConfirmeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirme sua senha';
    }

    return null;
  }

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    txtNomeTextControllerValidator = _txtNomeTextControllerValidator;
    txtEmailTextControllerValidator = _txtEmailTextControllerValidator;
    txtTelefoneTextControllerValidator = _txtTelefoneTextControllerValidator;
    txtSenhaVisibility = false;
    txtSenhaTextControllerValidator = _txtSenhaTextControllerValidator;
    txtConfirmeTextControllerValidator = _txtConfirmeTextControllerValidator;
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtTelefoneFocusNode?.dispose();
    txtTelefoneTextController?.dispose();

    txtCPFFocusNode?.dispose();
    txtCPFTextController?.dispose();

    txtSenhaFocusNode?.dispose();
    txtSenhaTextController?.dispose();

    txtConfirmeFocusNode?.dispose();
    txtConfirmeTextController?.dispose();

    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
