import '../Entidades/Cadastro.dart';
import '../Entidades/Listagem.dart';
import '../Repositorios/ContatosRepository.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});     //Construtor constante é criado para os fins de identificação

  @override
  _PrincipalState createState() => _PrincipalState();
}


//A Classe _PrincipalState é privada e nela a listagem será invocada, além de adicionar um botao de cadastro de novos contatos
class _PrincipalState extends State<Principal> {
  final ContatosRepository contatos = ContatosRepository();

  @override
  Widget build(BuildContext context) {   //Este widget deve permitir a criação de botões e chamada de funções de listagem e cadastro
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bem-Vindo à Agenda Telefônica',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),  //Personalizando interface do texto
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: ElevatedButton(      //Criando botão de cadastro e perdonalizando
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(contatos: contatos), //Construtor gerado
                    ),
                  );
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Text(
                    "Cadastrar Novo Contato",          //Settando novo botão
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Listagem(contatos: contatos), //Usando a classe Listagem
            ),
          ],
        ),
      ),
    );
  }
}