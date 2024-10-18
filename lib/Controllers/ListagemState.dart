
import 'package:flutter/material.dart';
import '../Dao/Dados.dart';
import '../Entidades/Contato.dart';
import '../Entidades/Listagem.dart';
import '../Repositorios/ContatosRepository.dart';
import 'EditarState.dart';

class ListagemState extends State<Listagem> {
  final ContatosRepository contatos;
  final Dados dados = Dados();


  ListagemState({required this.contatos});

  Future<List<Contato>> _carregarContatos() async {
    try {
      return await dados.obterContato(); // Chama a função que busca os contatos no banco
    } catch (e) {
      print(e); // Imprime o erro no console para debugar
      throw Exception('Erro ao carregar contatos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seus Contatos Salvos:'),
      ),
      body: FutureBuilder<List<Contato>>(
        future: _carregarContatos(), // Carrega os contatos
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar contatos: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum contato encontrado.'));
          }

          final contatosList = snapshot.data!; // Contatos carregados

          return ListView.builder(
            itemCount: contatosList.length,
            itemBuilder: (context, index) {
              Contato c = contatosList[index];

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
          );
        },
      ),
    );
  }
}
