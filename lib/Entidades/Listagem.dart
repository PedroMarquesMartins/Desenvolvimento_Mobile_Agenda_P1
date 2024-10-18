
import 'package:flutter/material.dart';

import '../Controllers/ListagemState.dart';
import '../Repositorios/ContatosRepository.dart';

//Da mesma forma que o cadastro, esta classe utiliza do metodo no @override para retornar uma instância de CadastroState
class Listagem extends StatefulWidget {
  final ContatosRepository contatos;

  Listagem({required this.contatos});  //Required indica obrigatoriedade da instância de contatos

  @override
  State<Listagem> createState() => ListagemState(contatos: contatos);
}