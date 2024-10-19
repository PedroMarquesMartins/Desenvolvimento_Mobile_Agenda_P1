import 'package:flutter/material.dart';
import '../Entidades/Contato.dart';
import '../Repositorios/ContatosRepository.dart';
import '../Dao/Dados.dart';  // Importa a classe Dados para acessar o método de remover

class ExcluirState extends StatelessWidget {
  final ContatosRepository contatos;
  final Contato contato;
  final Dados dados = Dados();  // Instancia a classe Dados

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
          onPressed: () async {
            await dados.removerContato(contato.id!);  // Remove o contato do banco de dados
            contatos.removerContato(contato);  // Remove o contato do repositório
            Navigator.pop(context);
            Navigator.pop(context, true); // Sai da tela de edição após exclusão
          },
          child: Text('Sim'),
        ),
      ],
    );
  }
}
