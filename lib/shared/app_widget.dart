
import 'package:flutter/material.dart';

import '../modules/home/home/home_view.dart';
import '../modules/home/new_task/add_new_task_view.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //'/sign_up_view': (context) => SignUpView(),
        '/home': (context) => const HomeView(),
        '/add_new': (context) => const AddNewTaskView(),
       // '/auth_view': (context) => AuthView(),
       // '/splash_view': (context) => SplashView(),
       // '/cadastro_concluido': (context) => CadastroConcluido(),
      },
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash_view',
    );
  }
}
