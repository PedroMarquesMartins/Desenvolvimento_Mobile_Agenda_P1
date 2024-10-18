import 'package:flutter/material.dart';
import '../Controllers/Principal.dart';

class MyApp extends StatelessWidget{

  //O widget faz o acesso as funções interativas do aplicativo, portanto fica em Override.
  @override
  Widget build(BuildContext context) {    //A classe MyApp inicia a classe principal, que fica responsável pelas funcionalidades principais.
    return MaterialApp(
      home: Principal(),  //Chamando a Classe em home
    );
  }
}