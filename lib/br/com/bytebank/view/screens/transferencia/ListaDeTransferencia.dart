import 'package:bytebank/br/com/bytebank/model/Transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FormularioTransferencia.dart';
import '../../widgets/ItemTransferencia.dart';

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