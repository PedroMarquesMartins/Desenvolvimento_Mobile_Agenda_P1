import '../Entidades/Cadastro.dart';
import '../Entidades/Listagem.dart';
import '../Repositorios/ContatosRepository.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget{
  final ContatosRepository contatos = ContatosRepository();  //Criando estância do repositório

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Bem-Vindo a Agenda!'),  //Nesta parte indico o titlo da tela principal
      ),
    body: Column(
      children: [
        ElevatedButton(        //Criando botao de Cadastro de contatos
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:(context)=>Cadastro(contatos:contatos),   //Indicando o construtor á classe Cadastro, com a função de cadastar novos contatos
              ),
            );
          },
          child: Text("Cadastro"),
        ),
        ElevatedButton(
          onPressed: (){         //OnPressed indica a função o qual o evento ativa
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:(context)=>Listagem(contatos:contatos),       //Neste caso, chama a listagem
              ),
            );
          },
          child: Text("Listar"),
        ),
      ],
    ),
    );
  }
}