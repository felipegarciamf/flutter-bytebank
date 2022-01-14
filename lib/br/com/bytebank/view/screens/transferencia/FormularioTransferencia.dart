import 'package:bytebank/br/com/bytebank/model/Transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/Editor.dart';

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
            dica: "0000",
            tipoTeclado: TextInputType.number,
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: "Valor",
            dica: "0.0",
            icone: Icons.monetization_on,
            tipoTeclado: TextInputType.number,
          ),
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