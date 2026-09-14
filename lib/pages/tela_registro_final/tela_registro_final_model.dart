import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'tela_registro_final_widget.dart' show TelaRegistroFinalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class TelaRegistroFinalModel extends FlutterFlowModel<TelaRegistroFinalWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txt_nome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  String? _txtNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'nomeImport is required';
    }

    return null;
  }

  // State field(s) for txt_email widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  String? _txtEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txt_nmr widget.
  FocusNode? txtNmrFocusNode;
  TextEditingController? txtNmrTextController;
  late MaskTextInputFormatter txtNmrMask;
  String? Function(BuildContext, String?)? txtNmrTextControllerValidator;
  String? _txtNmrTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Telefone deve ser preenchido';
    }

    return null;
  }

  // State field(s) for txt_CPF widget.
  FocusNode? txtCPFFocusNode;
  TextEditingController? txtCPFTextController;
  late MaskTextInputFormatter txtCPFMask;
  String? Function(BuildContext, String?)? txtCPFTextControllerValidator;
  String? _txtCPFTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'CPF deve ser preenchido';
    }

    return null;
  }

  // State field(s) for txt_senha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaTextController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaTextControllerValidator;
  String? _txtSenhaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Sua conta precisa ter uma senha';
    }

    if (val.length < 8) {
      return 'A senha deve ter no mínimo 8 caracteres';
    }

    return null;
  }

  // State field(s) for txt_cfmsenha widget.
  FocusNode? txtCfmsenhaFocusNode;
  TextEditingController? txtCfmsenhaTextController;
  late bool txtCfmsenhaVisibility;
  String? Function(BuildContext, String?)? txtCfmsenhaTextControllerValidator;
  String? _txtCfmsenhaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Verifique sua senha';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    txtNomeTextControllerValidator = _txtNomeTextControllerValidator;
    txtEmailTextControllerValidator = _txtEmailTextControllerValidator;
    txtNmrTextControllerValidator = _txtNmrTextControllerValidator;
    txtCPFTextControllerValidator = _txtCPFTextControllerValidator;
    txtSenhaVisibility = false;
    txtSenhaTextControllerValidator = _txtSenhaTextControllerValidator;
    txtCfmsenhaVisibility = false;
    txtCfmsenhaTextControllerValidator = _txtCfmsenhaTextControllerValidator;
  }

  @override
  void dispose() {
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtNmrFocusNode?.dispose();
    txtNmrTextController?.dispose();

    txtCPFFocusNode?.dispose();
    txtCPFTextController?.dispose();

    txtSenhaFocusNode?.dispose();
    txtSenhaTextController?.dispose();

    txtCfmsenhaFocusNode?.dispose();
    txtCfmsenhaTextController?.dispose();
  }
}
