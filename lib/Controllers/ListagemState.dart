import 'package:desenvolvimento_mobile_p1/Repositorios/ContatosRepository.dart';
import 'package:flutter/material.dart';
import '../Entidades/Contato.dart';
import '../Entidades/Listagem.dart';
import 'EditarState.dart';

class ListagemState extends State<Listagem> {
  final ContatosRepository contatos;

  ListagemState({required this.contatos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seus Contatos Salvos:'),
      ),
      body: ListView.builder(
        itemCount: contatos.getContatos().length,
        itemBuilder: (context, index) {
          Contato c = contatos.getContatos()[index];
          return ListTile(
            title: Text(c.nome),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c.email),
                Text(c.tel),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () async {
                bool? resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Editar(contatos: contatos, contato: c),
                  ),
                );

                if (resultado == true) {
                  setState(() {}); // Atualiza a lista
                }
              },
              child: Text('Editar'),
            ),
          );
        },
      ),
    );
  }
}