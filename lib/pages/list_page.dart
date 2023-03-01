import 'package:flutter/material.dart';

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
        appBar: AppBar(title: Text('Nova Tarefa')),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNomeTarefa,
                rotulo: 'Título da Tarefa',
                dica: 'Título da Tarefa'),
            Editor(
                controlador: _controladorCampoTarefa,
                rotulo: 'Tarefa',
                dica: 'Escreva uma descrição para sua tarefa.'),
            ElevatedButton(
                onPressed: () => _criaTarefa(context), child: Icon(Icons.done))
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

class Tarefa {
  final String nomeTarefa;
  final String tarefa;

  Tarefa(this.nomeTarefa, this.tarefa);

  @override
  String toString() {
    return 'Tarefa{tarefa: $tarefa, nomeTarefa: $nomeTarefa}';
  }
}

class ListaTarefas extends StatefulWidget {
  final List<Tarefa> _tarefas = [];

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Suas Listagens')),
      body: ListView.builder(
        itemCount: widget._tarefas.length,
        itemBuilder: (context, indice) {
          final tarefa = widget._tarefas[indice];
          return ItemTarefa(tarefa);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Tarefa?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTarefa();
          }));
          future.then((tarefaRecebida) {
            Future.delayed(Duration(seconds: 1), () {
              debugPrint('chegou no then do future');
              debugPrint('$tarefaRecebida');
              if (tarefaRecebida != null) {
                setState(() {
                  widget._tarefas.add(tarefaRecebida);
                });
              }
            });
          });
        },
      ),
    );
  }
}

class ItemTarefa extends StatelessWidget {
  final Tarefa _tarefas;

  ItemTarefa(this._tarefas);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(_tarefas.nomeTarefa),
      subtitle: Text(_tarefas.tarefa),
    ));
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;

  Editor({required this.controlador, required this.rotulo, required this.dica});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: controlador,
          style: TextStyle(fontSize: 16.0),
          decoration: InputDecoration(
            labelText: rotulo,
            hintText: dica,
          ),
        ));
  }
}
