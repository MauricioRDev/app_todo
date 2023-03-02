class Tarefa {
  final String nomeTarefa;
  final String tarefa;

  Tarefa(this.nomeTarefa, this.tarefa);

  @override
  String toString() {
    return 'Tarefa{tarefa: $tarefa, nomeTarefa: $nomeTarefa}';
  }
}