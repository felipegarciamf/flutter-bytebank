import 'package:bytebank/br/com/bytebank/model/Usuario.dart';
import 'package:bytebank/br/com/bytebank/view/screens/cadastroUsuario/FormularioCadastroView.dart';
import 'package:bytebank/br/com/bytebank/view/widgets/Editor.dart';
import 'package:bytebank/br/com/bytebank/view/screens/transferencia/ListaDeTransferenciaView.dart';
import 'package:bytebank/br/com/bytebank/viewmodel/login/LoginViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _controladorUsuario = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();
  final LoginViewModel loginViewModel = LoginViewModel();

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
            onPressed: () => loginViewModel.loginUsuario(context, _controladorSenha, _controladorUsuario),
            child: Text("Logar"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CadastroView();
              }));

            },
            child: Text("Cadastre-se"),
          )
        ],
      ),
    );
  }



}