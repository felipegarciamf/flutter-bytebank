import 'package:bytebank/br/com/bytebank/model/Transferencia.dart';
import 'package:bytebank/br/com/bytebank/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FormularioTransferenciaView.dart';
import '../../widgets/ItemTransferencia.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          cadastraFormulario(context);
        },
      ),
    );
  }

  void cadastraFormulario(BuildContext context) {
    final Future future =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FormularioTransferencia();
    }));
    future.then((transferenciaRecebida) {
      Future.delayed(Duration(seconds: 1), () {
        if (Utils.validaItemNulo(transferenciaRecebida)) {
          setState(() {
            widget._transferencias.add(transferenciaRecebida);
          });
        }
      });
    });
  }
}
