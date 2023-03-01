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
        height: double.infinity,
        width: double.infinity,
        color: Colors.purple,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.purple,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.purple,
                ),
                const Text("Cadastro concluído!"),
                Align(
                  alignment: const Alignment(0.00, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // ignore: avoid_print
                      print("clicou!!");
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(187, 3, 40, 104)),
                    ),
                    child: const Text("Começar"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
