import 'package:flutter/material.dart';

class CadastroConcluido extends StatefulWidget {
  const CadastroConcluido({Key? key, required String title}) : super(key: key);

  @override
  State<CadastroConcluido> createState() => _CadastroConcluidoState();
}

class _CadastroConcluidoState extends State<CadastroConcluido> {
  Widget _body() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.purple,
      child: ListView(
        children: [
          Column(children: [
            Container(
              height: 120,
            ),
            const Text(
              'Cadastro concluído!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Container(
              height: 20,
            ),
            Align(
              alignment: const Alignment(0.00, 0),
              child: ElevatedButton(
                onPressed: () {
                  // FormularioTarefa(context);
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
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: const EdgeInsets.only(top: 130),
                child: Center(
                  child: SizedBox(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(250),
                        topRight: Radius.circular(250),
                      ),
                      child: Image.network(
                          'https://github.com/MauricioRDev/app_todo/blob/main/assets/images/corujinha.jpg?raw=true'),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _body(),
        Container(
            margin: const EdgeInsets.only(top: 550),
            height: 30,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Os ventos da programação estão indo até você',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF3101B9),
                ),
              ),
            ))
      ],
    ));
  }
}

/* void telaTodo(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => FormularioTarefa(context),
    ),
  );
} */
}
