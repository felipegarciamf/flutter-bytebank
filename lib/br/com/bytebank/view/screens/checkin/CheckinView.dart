import 'package:bytebank/br/com/bytebank/model/HoraCheckin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckinView extends StatelessWidget {
  final DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkin"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          children: [
            Text(
              data.toString(),
            ),
            ElevatedButton(
                onPressed: () {
                  debugPrint(data.toString());
                  final checkinHora = HoraCheckin(data.toString());
                  Navigator.pop(context, checkinHora);
                },
                child: Text("Checkin"))
          ],
        ),
      ),
    );
  }
}
