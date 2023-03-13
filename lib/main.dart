
import 'package:app_todo/modules/auth/auth_confirm.dart';
import 'package:app_todo/modules/auth/model/auth_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/auth/model/repository/user_repository.dart';
import 'modules/home/home/home_model.dart';
import 'modules/home/home/home_view.dart';
import 'modules/home/home/repository/home_repository.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthConfirm(AuthModel(), AuthRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeView(
          HomeModel(),
          HomeRepository(),
        ),
        ),
       
      ],)
  );

}
