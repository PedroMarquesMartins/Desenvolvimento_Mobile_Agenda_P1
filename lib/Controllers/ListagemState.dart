import 'package:desenvolvimento_mobile_p1/Repositorios/ContatosRepository.dart';
import 'package:flutter/material.dart';

import '../Entidades/Contato.dart';
import '../Entidades/Listagem.dart';

//Esta classe é responsável por listar todos os dados de Cadastro armazenados em memória
class ListagemState extends State<Listagem> {
  final ContatosRepository contatos;      //Instância da entidade contato para fim de gerar o repositório.

  ListagemState({required this.contatos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de Contatos'),  //Titulo indicado para a sessão de listagem
      ),
      body: ListView.builder(
        itemCount: contatos.getContatos().length,
        //O construtor, uma vez tendo a quantidade de contatos cadastrados, automaticamente percorre a memória, assim listando um por um
        itemBuilder: (context, index) {
          Contato c = contatos.getContatos()[index];     //Pegando o objeto da classe
          return ListTile(
            //No ListTitle indicamos as variáveis que indicam os devidos atributos nome, email e telefone, sequencialmente
            title: Text(c.nome),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //Alinhamento
              children: [
                Text(c.email),
                Text(c.tel),
              ],
            ),
          );
        },
      ),
    );
  }
}