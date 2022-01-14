import 'package:bytebank/br/com/bytebank/model/Usuario.dart';
import 'package:bytebank/br/com/bytebank/utils/Utils.dart';
import 'package:bytebank/br/com/bytebank/view/screens/transferencia/ListaDeTransferenciaView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginViewModel {

  void loginUsuario(
      BuildContext context,
      TextEditingController controladorSenha,
      TextEditingController controladorUsuario) {
    final String usuario = controladorUsuario.text;
    final String senha = controladorSenha.text;

    if (Utils.validaStringVazia(usuario) && Utils.validaStringVazia(senha)) {
      final login = Usuario(usuario, senha);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ListaTransferencias();
      }));
    }
  }

}
