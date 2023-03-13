
import 'package:app_todo_lovepeople/app_widget.dart';
import 'package:app_todo_lovepeople/modules/auth/model/auth_model.dart';
import 'package:app_todo_lovepeople/modules/home/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/auth/auth_confirm.dart';
import 'modules/auth/model/repository/user_repository.dart';
import 'modules/home/home/model/home_model.dart';
import 'modules/home/home/repository/home_repository.dart';
import 'modules/home/new_task/add_new_task_presenter.dart';
import 'modules/home/new_task/model/add_new_task_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
       ChangeNotifierProvider(
          create: (context) => AuthConfirm(AuthModel(), AuthRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              AddNewTaskPresenter(AddNewTaskModel(), HomeRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePresenter(
          HomeModel(),
          HomeRepository(),
        ),
        ),
       
      ],
      child: const AppWidget(),
      ),
  );
}
