import 'package:bytebank/br/com/bytebank/view/screens/transferencia/ListaDeTransferenciaView.dart';
import 'package:bytebank/br/com/bytebank/view/widgets/Editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();
  final TextEditingController _controladorConfirmacaoSenha =
      TextEditingController();

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
                final String senha = _controladorSenha.text;
                final String confirmacaoSenha = _controladorConfirmacaoSenha.text;

                if(senha == confirmacaoSenha){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListaTransferencias();
                  }));
                }
              },
              child: Text("Cadastrar"))
        ],
      ),
    );
  }
}
