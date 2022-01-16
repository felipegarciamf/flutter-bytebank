

import 'package:bytebank/br/com/bytebank/model/HoraCheckin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCheckin extends StatelessWidget {

  final HoraCheckin _horaCheckin;

  ItemCheckin(this._horaCheckin);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.access_time),
        title: Text("Data do Checkin"),
        subtitle: Text(_horaCheckin.toString()),
      ),
    );
  }
}
