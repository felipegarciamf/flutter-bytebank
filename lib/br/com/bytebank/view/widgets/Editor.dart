import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;

  final String? rotulo;

  final String? dica;

  final IconData? icone;

  final TextInputType? tipoTeclado;

  final bool? password;

  Editor(
      {this.controlador,
        this.rotulo,
        this.dica,
        this.icone,
        this.tipoTeclado,
        this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        obscureText: password != null,
        controller: controlador,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: tipoTeclado,
      ),
    );
  }
}