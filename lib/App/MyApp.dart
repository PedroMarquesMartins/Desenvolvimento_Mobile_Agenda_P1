import 'package:flutter/material.dart';
import '../Controllers/Autenticacao/Token.dart';
import '../Controllers/Principal.dart';
import '../Controllers/LoginUsuarioState.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: FutureBuilder<String?>(
        future: carregarDados('token'),
        builder: (context, snapshot) {
            String? StringNova = snapshot.data;
            print('Conteúdo do token ma MyApp: ${StringNova}');
            if (StringNova != null && StringNova.isNotEmpty) {
              return Principal(); //tela Principal
            }else{
              return LoginUsuarioState(); //Login
            }
        },
      ),
    );
  }
}