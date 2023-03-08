import 'package:app_todo/models/tarefa.dart';
import 'package:app_todo/pages/list_page.dart';
import 'package:flutter/material.dart';

class ListController {
  final ListController _listRepository;
  ListController(this._listRepository) {
    fetch();
  }

  ValueNotifier<ListaTarefas?> tarefas = ValueNotifier<ListaTarefas?>(null);

  fetch() async {
  }
}
