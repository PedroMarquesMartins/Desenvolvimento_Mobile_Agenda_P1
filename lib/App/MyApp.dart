import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controllers/Principal.dart';
import '../Controllers/LoginUsuarioState.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Future bilder trabalhando com booleano
    return FutureBuilder<bool>(
        future: _Login(), //Chama a função para verificar o login
        builder: (BuildContext context, AsyncSnapshot<bool> entrada) {
          //Direciona a tela se estiver logado
          return MaterialApp(

            home: entrada.data == true ? Principal() : LoginUsuarioState(), //Não está funcionando ;-;
          );
        });
  }
  //Essa função verifica se ja consta o token registrado
  Future<bool> _Login() async {
    final SharedPreferences preferencias = await SharedPreferences.getInstance();
    return preferencias.containsKey('token');
  }
}
