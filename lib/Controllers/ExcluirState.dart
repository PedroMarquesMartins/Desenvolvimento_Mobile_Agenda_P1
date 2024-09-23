import 'package:flutter/material.dart';
import '../Entidades/Contato.dart';
import '../Repositorios/ContatosRepository.dart';

class ExcluirState extends StatelessWidget {
  final ContatosRepository contatos;
  final Contato contato;

  //Esta classe tem a função de excluir contatos desejados

  ExcluirState({required this.contatos, required this.contato});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Excluir Contato'),
      content: Text('Tem certeza que deseja excluir este contato?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); //Fecha o dialogo sem excluir
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            contatos.removerContato(contato); //Remove o contato
            Navigator.pop(context);
            Navigator.pop(context, true); //Sai da tela de edição após exclusão
          },
          child: Text('Sim'),
        ),
      ],
    );
  }
}
