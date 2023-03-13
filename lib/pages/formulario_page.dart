import 'package:app_todo_lovepeople/widgets/ball_colors.dart';
import 'package:flutter/material.dart';

class FormularioTarefa extends StatefulWidget {
  const FormularioTarefa({super.key, required String title});

  @override
  State<FormularioTarefa> createState() => FormularioTarefaState();
}

class FormularioTarefaState extends State<FormularioTarefa> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
        color: const Color.fromRGBO(169, 1, 247, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(100),
                      ),
                      child: Image.network(
                          "https://raw.githubusercontent.com/MauricioRDev/app_todo/main/assets/images/corujag.jpg"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'Nova Tarefa',
                        style: TextStyle(
                            fontFamily: 'Montserrat-SemiBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Título da Tarefa',
                        hintStyle: TextStyle(
                            fontFamily: 'Tahoma',
                            fontWeight: FontWeight.bold,
                            color: const Color(0x003101b9).withOpacity(1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.9,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 20,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Escreva uma descrição para sua tarefa',
                        hintStyle: TextStyle(
                            fontFamily: 'Tahoma',
                            color: const Color(0x003101b9).withOpacity(1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Ballcolors(color: Color(0x00fff2cc)),
                    Ballcolors(color: Color(0x00ffd9f0)),
                    Ballcolors(color: Color(0x00e8c5ff)),
                    Ballcolors(color: Color(0x00cafbff)),
                    Ballcolors(color: Color(0x00e3ffe6)),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                  iconSize: 62.0,
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.done_rounded),
                  iconSize: 62.0,
                  color: Colors.white,
                ),
              ])
            ],
          ),
        ));
  }
}
