import '../Entidades/Cadastro.dart';
import '../Entidades/Listagem.dart';
import '../Repositorios/ContatosRepository.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final ContatosRepository contatos = ContatosRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bem-Vindo à Agenda Telefônica',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(contatos: contatos),
                    ),
                  );
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Text(
                    "Cadastrar Novo Contato",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Listagem(contatos: contatos), // Usando a classe Listagem
            ),
          ],
        ),
      ),
    );
  }
}