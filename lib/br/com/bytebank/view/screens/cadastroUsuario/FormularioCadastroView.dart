import 'package:bytebank/br/com/bytebank/model/CadastroUsuario.dart';
import 'package:bytebank/br/com/bytebank/view/screens/transferencia/ListaDeTransferenciaView.dart';
import 'package:bytebank/br/com/bytebank/view/widgets/Editor.dart';
import 'package:bytebank/br/com/bytebank/viewmodel/cadastroUsuario/FormularioCadastroViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();
  final TextEditingController _controladorConfirmacaoSenha =
      TextEditingController();

  final CadastroViewModel cadastroViewModel = CadastroViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Usuario"),
      ),
      body: ListView(
        children: [
          Editor(
            dica: "Nome",
            rotulo: "Nome",
            controlador: _controladorNome,
          ),
          Editor(
            dica: "Email",
            rotulo: "Email",
            controlador: _controladorEmail,
          ),
          Editor(
            dica: "Senhas",
            rotulo: "Senha",
            controlador: _controladorSenha,
            password: true,
          ),
          Editor(
            dica: "Senha",
            rotulo: "Senha",
            controlador: _controladorConfirmacaoSenha,
            password: true,
          ),
          ElevatedButton(
              onPressed: () {
                CadastroUsuario usuario = CadastroUsuario(
                  _controladorNome.text,
                  _controladorEmail.text,
                  _controladorSenha.text,
                  _controladorConfirmacaoSenha.text,
                );
                cadastroViewModel.cadastroUsuario(context, usuario);
              },
              child: Text("Cadastrar"))
        ],
      ),
    );
  }
}