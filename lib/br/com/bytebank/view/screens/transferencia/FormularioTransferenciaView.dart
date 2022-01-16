import 'package:bytebank/br/com/bytebank/model/Transferencia.dart';
import 'package:bytebank/br/com/bytebank/viewmodel/transferencia/FormularioTransferenciaViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/Editor.dart';

class FormularioTransferenciaView extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  final FormularioTransferenciaViewModel formularioViewModel =
      FormularioTransferenciaViewModel();



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
            tipoTeclado: TextInputType.datetime,
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: "Valor",
            dica: "0.0",
            icone: Icons.monetization_on,
            tipoTeclado: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () => formularioViewModel.criaTransferencia(
              context,
              _controladorCampoValor,
              _controladorCampoNumeroConta,
            ),
            child: Text("Confirmar"),
          ),
        ],
      ),
    );
  }
}
