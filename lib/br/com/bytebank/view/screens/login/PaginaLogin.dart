import 'package:bytebank/br/com/bytebank/model/Usuario.dart';
import 'package:bytebank/br/com/bytebank/view/widgets/Editor.dart';
import 'package:bytebank/br/com/bytebank/view/screens/transferencia/ListaDeTransferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaLogin extends StatelessWidget {
  final TextEditingController _controladorUsuario = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Byte Bank"),
      ),
      body: Column(
        children: [
          Editor(
            controlador: _controladorUsuario,
            rotulo: "Usuario",
            dica: "Login de Usuario",
            tipoTeclado: TextInputType.text,
          ),
          Editor(
            password: true,
            controlador: _controladorSenha,
            rotulo: "Password",
            dica: "Senha do usuário",
            tipoTeclado: TextInputType.visiblePassword,
          ),
          ElevatedButton(
            onPressed: () => _loginUsuario(context),
            child: Text("Logar"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Cadastre-se"),
          )
        ],
      ),
    );
  }

  void _loginUsuario(BuildContext context) {
    final String usuario = _controladorUsuario.text;
    final String senha = _controladorSenha.text;

    if (usuario != "" && senha != "") {
      final login = Usuario(usuario, senha);
      debugPrint("e ai foi?");
      debugPrint('$login');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ListaTransferencias();
      }));
    }
  }

}