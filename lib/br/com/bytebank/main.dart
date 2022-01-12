import 'package:flutter/material.dart';

void main() => runApp(
      ByteBankApp(),
    );

class ListaTransferencias extends StatelessWidget {
  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    _transferencias.add(Transferencia(1241.0, 124214));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencias'),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint("chegou no then do future");
            debugPrint("$transferenciaRecebida");
            _transferencias.add(transferenciaRecebida);
          });

          debugPrint("entrou aqui");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _tranferencia;

  ItemTransferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.monetization_on,
        ),
        title: Text(_tranferencia.valor.toString()),
        subtitle: Text(_tranferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class Usuario {
  final String usuario;
  final String senha;

  Usuario(this.usuario, this.senha);

  @override
  String toString() {
    return 'Usuario{usuario: $usuario, senha: $senha}';
  }
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PaginaLogin(),
      ),
    );
  }
}

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
          ),
          Editor(
            controlador: _controladorSenha,
            rotulo: "Password",
            dica: "Senha do usuário",
          ),
          ElevatedButton(
            onPressed: () {

              final String usuario = _controladorUsuario.text;
              final String senha = _controladorSenha.text;

             final login = Usuario(usuario, senha);

              debugPrint("e ai foi?");
              debugPrint('$login');

            },
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

  _criaTransferencia() {


  }


}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferencia asdas dasda"),
      ),
      body: Column(
        children: [
          Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: "Número da Conta",
              dica: "0000"),
          Editor(
              controlador: _controladorCampoValor,
              rotulo: "Valor",
              dica: "0.0",
              icone: Icons.monetization_on),
          ElevatedButton(
            onPressed: () => _criaTransferencia(context),
            child: Text("Confirmar"),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint("Criando Transferencia");
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;

  final String? rotulo;

  final String? dica;

  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
