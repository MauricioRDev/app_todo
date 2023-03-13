import 'package:app_todo/modules/auth/auth_confirm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/login_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(169, 1, 247, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<AuthConfirm>(builder: (context, presenter, child){
          
          return Column(
            children: [
              Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 42)),
                      Image.network(
                        "https://raw.githubusercontent.com/MauricioRDev/app_todo/main/assets/images/corujag.jpg",
                        width: 200,
                        height: 200,
                      ),
                      const Text(
                        "Lovepeople",
                        style: TextStyle(
                            color: Color.fromRGBO(49, 1, 185, 1),
                            fontFamily: "Montserrat-Bold",
                            fontSize: 20,
                            fontWeight:  FontWeight.bold),
                      )
                    ],
                  )),
              const SizedBox(
                height: 60 * 1,
              ),
              const Center(
                child: Text(
                  "Que bom que você voltou!",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: "Montserrat-SemiBold",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Widigetlogin(),
              const SizedBox(
                height: 28,
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 18,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Padding(padding: EdgeInsets.only(left: 8)),
                const Text(
                  "Não possui cadastro?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Tahoma",
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: const Text(
                    "Clique aqui",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 214, 0, 1),
                      fontFamily: "Tahoma",
                      fontSize: 20,
                    ),
                  ),
                )
              ]),
            ],
          );
  }),
      ),
    ));
  }
}
