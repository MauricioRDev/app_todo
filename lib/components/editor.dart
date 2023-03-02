import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  Editor({required this.controlador, required this.rotulo, required this.dica, required this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: controlador,
          style: const TextStyle(fontSize: 16.0),
          decoration: InputDecoration(
            icon: icone != null? Icon(icone) : null,
              labelText: rotulo,
              hintText: dica,
          ),
        ));
  }
}