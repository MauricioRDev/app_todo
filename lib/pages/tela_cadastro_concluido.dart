import 'package:flutter/material.dart';

class CadastroConcluido extends StatefulWidget {
  const CadastroConcluido({super.key});

  @override
  State<CadastroConcluido> createState() => _CadastroConcluidoState();
}

class _CadastroConcluidoState extends State<CadastroConcluido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(169, 1, 247, 1),
        padding: const EdgeInsets.only(top: 0),
        alignment: AlignmentDirectional.topEnd,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print("clicou!!");
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(104, 10, 13, 185)),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.only(right: 22, left: 22)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(width: 1, color: Colors.white),
                ),
              ),
            ),
            child: const Text("Começar"),
          ),
        ),
      ),
    );
  }
}
