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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Center(
              child: Padding(
                padding: EdgeInsets.all(42.0),
                child: Text(
                  'Suas listagens',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
            Card(
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Busque palavras-chave',
                  hintStyle: TextStyle(color: Colors.deepPurple.shade900),
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: Colors.deepPurple.shade900,
                ),
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
      ),
      floatingActionButton: Center(
        heightFactor: 2,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.purpleAccent[700],
          child: const Icon(
            Icons.add,
            size: 60,
          ),
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
          color: const Color.fromARGB(255, 207, 235, 209),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_tarefa.nomeTarefa}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, color: Colors.deepPurple.shade900
                      ),
                    ),
                    Text('${_tarefa.tarefa}', style: TextStyle(color: Colors.deepPurple.shade900),),
                  ],
                )),
                IconButton(
                    onPressed: () => _delete(context, tarefa),
                    icon: Icon(Icons.delete, color: Colors.deepPurple.shade900))
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
                  const Text('Deseja deletar o todo?'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Cancelar')),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Confirmar')),
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
