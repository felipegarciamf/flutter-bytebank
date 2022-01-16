import 'package:bytebank/br/com/bytebank/model/HoraCheckin.dart';
import 'package:bytebank/br/com/bytebank/utils/Utils.dart';
import 'package:bytebank/br/com/bytebank/view/screens/checkin/CheckinView.dart';
import 'package:bytebank/br/com/bytebank/view/widgets/ItemCheckin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaDeCheckinView extends StatefulWidget {
  final List<HoraCheckin> _horaCheckins = [];

  @override
  ListaDeCheckinState createState() => ListaDeCheckinState();
}


class ListaDeCheckinState extends State<ListaDeCheckinView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Checkin"),
      ),
      body: ListView.builder(
        itemCount: widget._horaCheckins.length,
        itemBuilder: (context, indice) {
          final checkin = widget._horaCheckins[indice];
          return ItemCheckin(checkin);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          cadastraCheckin(context);
        },
      ),
    );
  }

  void cadastraCheckin(BuildContext context) {
    Future future = Navigator.push(
        context, MaterialPageRoute(builder: (context) {
      return CheckinView();
    }));
    future.then((checkinRecebido) {
      Future.delayed(Duration(seconds: 1), () {
        if (Utils.validaObjetoNulo(checkinRecebido)) {
          setState(() {
            widget._horaCheckins.add(checkinRecebido);
          });
        }
      });
    });
  }

}
