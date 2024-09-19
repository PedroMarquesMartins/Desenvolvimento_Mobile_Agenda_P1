import 'package:desenvolvimento_mobile_p1/Repositorios/ContatosRepository.dart';
import 'package:flutter/material.dart';
import 'package:desenvolvimento_mobile_p1/Controllers/CadastroState.dart';

class Cadastro extends StatefulWidget {
  final ContatosRepository contatos; //A classe Cadastro recebe uma instância de ContatosRepository como parâmetro no seu construtor
  Cadastro({required this.contatos});

  //Este método retorna uma instância de CadastroState, que gerenciará o estado do widget
  @override
  State<Cadastro> createState() => CadastroState(contatos:contatos);
}