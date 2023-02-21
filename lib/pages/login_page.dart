import 'dart:math';

import 'package:app_todo/common_widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(120),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: Text(
                          'LovePeople',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //parte de baixo
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 280,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 169, 1, 255),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    //LOGIN
                    CustomTextField(
                      icon: Icons.person,
                      label: 'Número de telefone, email ou CPF',
                    ),

                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),
                    Text(
                      'Esqueceu seu login ou senha?  Clique Aqui',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),

                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
