import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  //exemplo page controller ->
  //int currentIndex = 0;
  //final PageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //controller: ,//PageController,
        children: const [
          //exemplo
          //telacadastro();
          //paginadalista();
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // apenas um teste, para validar a funcionalidade do ElevatedButton
          // ignore: avoid_print
          print("clicou!!");
        },
      ),
    );
  }
}
