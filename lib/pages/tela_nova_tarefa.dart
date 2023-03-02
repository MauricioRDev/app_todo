import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../models/tarefa.dart';

class FormularioTarefa extends StatefulWidget {
  const FormularioTarefa({super.key});

  @override
  State<FormularioTarefa> createState() => FormularioTarefaState();
}

class FormularioTarefaState extends State<FormularioTarefa> {
  final TextEditingController _controladorCampoNomeTarefa =
      TextEditingController();
  final TextEditingController _controladorCampoTarefa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Nova Tarefa')),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNomeTarefa,
                rotulo: 'Título da Tarefa',
                dica: 'Título da Tarefa', icone: null, ),
            Editor(
                controlador: _controladorCampoTarefa,
                rotulo: 'Tarefa',
                dica: 'Escreva uma descrição para sua tarefa.', icone: null,),
            ElevatedButton(
                onPressed: () => _criaTarefa(context), child: const Icon(Icons.done))
          ],
        )));
  }

  void _criaTarefa(BuildContext context) {
    debugPrint('clicou no confirmar');
    final String nomeTarefa = _controladorCampoNomeTarefa.text;
    final String tarefa = _controladorCampoTarefa.text;
    if (nomeTarefa != null && tarefa != null) {
      final tarefaCriada = Tarefa(nomeTarefa, tarefa);
      debugPrint('Criando Tarefa');
      debugPrint('$tarefaCriada');
      Navigator.pop(context, tarefaCriada);
    }
  }
}