import 'package:desenvolvimento_mobile_p1/Repositorios/ContatosRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Entidades/Cadastro.dart';
import '../Entidades/Contato.dart';

//Esta classe é responsável por ler as inserções do usuário e associá-los as instâncias de suas devidas entidades, armazenando-as em memória
class CadastroState extends State<Cadastro> {

  //Criando as variáveis que receberão os campos de inserção
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final ContatosRepository contatos;

  CadastroState({required this.contatos}); //Associando ao contato. O required indica obrigatoriedade

  //O widget a seguir tem a função de gerarar os campos de incersão, atribuindo as variáveis locais com os itens do objeto contato
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contatos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), //Campo
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Entre com nome'),
              controller: nomeController,   //Atribuição a variavel local
            ),
            TextField(
              //Assim sucessivamente
              decoration: InputDecoration(labelText: 'Entre com o email'),
              controller: emailController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Entre com o telefone'),
              controller: telController,
            ),
            SizedBox(height: 20),

            //Este é o actionEvent do botão salvar. Ele atribui os itens locais ao objeto contato.
            ElevatedButton(
              onPressed: () {
                setState(() {
                  contatos.addContatos(Contato(
                      nome: nomeController.text,
                      email: emailController.text,
                      tel: telController.text));
                });
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}