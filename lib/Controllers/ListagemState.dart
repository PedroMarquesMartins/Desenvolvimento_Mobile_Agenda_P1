import 'package:desenvolvimento_mobile_p1/Repositorios/ContatosRepository.dart';
import 'package:flutter/material.dart';
import '../Entidades/Contato.dart';
import '../Entidades/Listagem.dart';
import 'EditarState.dart';

//A Função desta classe é, alem de listar os contatos, adicionar um botão para cada, permitindo a edição
//chamando a classe EditarState passando os campos preenchidos como parâmetro.
class ListagemState extends State<Listagem> {
  final ContatosRepository contatos;

  ListagemState({required this.contatos});  //Contrutor, assim como nas demais classes apresentadas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seus Contatos Salvos:'),  //Titulo para a interface
      ),
      body: ListView.builder(
        itemCount: contatos.getContatos().length,
        itemBuilder: (context, index) {

          Contato c = contatos.getContatos()[index];  //Instanciando contatos c

          //Neste return, terá o retorno de cada campo contido em contato, como nome, email e telefone.
          return ListTile(
            title: Text(c.nome),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,  //Alinhamento na esquerda
              children: [
                Text(c.email),
                Text(c.tel),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () async {
                bool? resultado = await Navigator.push(    //Verificando se o booleano é true para resultado
                  context,
                  MaterialPageRoute(
                    builder: (context) => Editar(contatos: contatos, contato: c), //Chamando a classe editar passando o contato especifico como parametro
                  ),
                );

                if (resultado == true) {
                  setState(() {}); //Atualiza a lista
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