import 'package:app_todo/pages/tela_nova_tarefa.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Column(
          children: const [
            Center(
              child: Text(
                'Suas Listagens',
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          const Card(
            child: TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Busque palavras-chave',
              suffixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: widget._tarefas.length,
                itemBuilder: (context, indice) {
                  final tarefa = widget._tarefas[indice];
                  return ItemTarefa(tarefa);
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<Tarefa?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormularioTarefa();
          }));
          future.then((tarefaRecebida) {
            Future.delayed(const Duration(seconds: 1), () {
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
  Tarefa get tarefa => _tarefa;

  set tarefa(Tarefa tarefa) {
    tarefa = _tarefa;
  }

  ItemTarefa(this._tarefa);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${_tarefa.nomeTarefa}',),
                    Text('${_tarefa.tarefa}'),
                  ],
                )),
                IconButton(
                    onPressed: () => _delete(context, tarefa),
                    icon: const Icon(Icons.delete, color: Colors.red))
              ],
            ),
          ),
        ));
  }

  void _delete(BuildContext context, tarefa) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Deseja deletar o todo: ${tarefa.tarefa?.title}?'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Não')),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Sim')),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
