import 'package:bytebank/br/com/bytebank/view/screens/login/LoginView.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      ByteBankApp(),
    );

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


