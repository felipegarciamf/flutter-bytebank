import 'package:bytebank/br/com/bytebank/model/Transferencia.dart';
import 'package:flutter/cupertino.dart';

class FormularioTransferenciaViewModel {
  void criaTransferencia(
      BuildContext context,
      TextEditingController controladorCampoValor,
      TextEditingController controladorCampoNumeroConta) {
    final int? numeroConta = int.tryParse(controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint("Criando Transferencia");
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
