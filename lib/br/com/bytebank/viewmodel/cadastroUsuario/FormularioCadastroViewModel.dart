import 'package:bytebank/br/com/bytebank/model/CadastroUsuario.dart';
import 'package:bytebank/br/com/bytebank/view/screens/transferencia/ListaDeTransferenciaView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroViewModel {
  void cadastroUsuario(BuildContext context, CadastroUsuario usuario) {
    final String senha = usuario.senha;
    final String confirmacaoSenha = usuario.confirmacaoSenha;

    if (senha == confirmacaoSenha) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ListaTransferenciasView();
      }));
    }
  }
}
