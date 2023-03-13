import 'package:flutter/material.dart';
import 'package:app_todo/common_widget/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../auth_confirm.dart';


class Widigetlogin extends StatefulWidget {
  const Widigetlogin({super.key});

  @override
  State<Widigetlogin> createState() => _WidigetloginState();
}

class _WidigetloginState extends State<Widigetlogin> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Consumer<AuthConfirm>(builder: (context, presenter, child){
      return Column(
        children: [
          Form(
            child: Column(
              children: [
                const Padding(
                  padding:  EdgeInsets.only(left: 30, right: 30),
                  child: CustomTextField(icon: Icons.login, label: 'Número de Telefone, email ou CPF',
                  
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child:  CustomTextField(
                  
                    icon: Icons.lock_outline,
                    label: 'Senha',
                    isSecret: true,
                    
                ),
                ),
                Row(children: [
                  const Padding(padding: EdgeInsets.only(left: 35, top: 20)),
                  const Text(
                    "Esqueceu seu login ou senha?",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Tahoma",
                      fontSize: 16,
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
                        fontSize: 16,
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all(const Color.fromRGBO(49, 1, 185, 1))),
            onPressed: () async{
              await presenter.authRepository.postUserAuth();
            },
            child: const Text(
              "Entrar",
              style: TextStyle(
                fontFamily: "Montserrat-SemiBold",
                fontSize: 30,
              ),
            ),
          ),
        ],
      );
  })));
  }
}