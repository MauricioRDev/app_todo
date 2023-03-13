import 'package:app_todo/modules/home/home/repository/home_repository.dart';
import 'package:app_todo/modules/home/new_task/model/add_new_task_json.dart';
import 'package:flutter/material.dart';

import 'home_model.dart';

class HomeView with ChangeNotifier {
  final HomeRepository homeRepository;
  final HomeModel homeModel;

  HomeView(
    this.homeModel,
    this.homeRepository,
  );

  String searchText = '';

  List<ToDo> toDoList = [];

  List<ToDo> listToShow = [];

  void onChangeText(String value) async {
    listToShow = toDoList.where((element) {
      return element.title
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase());
    }).toList();
    print(listToShow);
    notifyListeners();
  }

  deleteToDos(int id) async {
    await homeRepository.delTodos(id);
    getToDos();
  }

  getToDos() async {
    toDoList = await homeRepository.getToDos();
    listToShow = toDoList;
    notifyListeners();
  }
}
