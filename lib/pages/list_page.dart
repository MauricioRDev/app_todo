import 'package:app_todo/pages/tela_nova_tarefa.dart';
import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../models/tarefa.dart';

class ListaTarefas extends StatefulWidget {
  final List<Tarefa> _tarefas = [];

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  final TextEditingController _controladorCampoPesquisa =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: arrumar a caixa de pesquisa
      drawer: Drawer( child: Column(
        children: [
          Editor(controlador: _controladorCampoPesquisa, rotulo: 'Busque por uma palavra-chave', dica: 'dica', icone: Icons.search),
        ],
      )),
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

//Card responsável pela criação da tarefa
class ItemTarefa extends StatelessWidget {
  final Tarefa _tarefa;

  ItemTarefa(this._tarefa);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: const Icon(Icons.delete),
        title: Text(_tarefa.nomeTarefa),
        subtitle: Text(_tarefa.tarefa),
    ));
  }
}


