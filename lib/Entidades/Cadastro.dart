
import 'package:flutter/material.dart';

import '../Controllers/CadastroState.dart';
import '../Repositorios/ContatosRepository.dart';

class Cadastro extends StatefulWidget {
  final ContatosRepository contatos; //A classe Cadastro recebe uma instância de ContatosRepository como parâmetro no seu construtor
  Cadastro({required this.contatos});

  //Este método retorna uma instância de CadastroState, que gerenciará o estado do widget
  @override
  State<Cadastro> createState() => CadastroState(contatos:contatos);
}