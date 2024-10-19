import 'package:flutter/material.dart';
import '../Dao/Dados.dart';
import '../Entidades/Contato.dart';
import 'package:flutter/services.dart';
import '../Controllers/ExcluirState.dart';
import '../Repositorios/ContatosRepository.dart';

class Editar extends StatefulWidget {
  final ContatosRepository contatos; //Repositorio é instanciado
  final Contato contato; //contato a ser editado

  Editar({required this.contatos, required this.contato});

  @override
  EditarState createState() =>
      EditarState(contatos: contatos, contato: contato);
}

class EditarState extends State<Editar> {
  final ContatosRepository contatos;
  final Contato contato;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final Dados dados = Dados();  // Instancia a classe Dados

  bool emailValido = true;
  bool nomeValido = true;
  bool telValido = true;

  EditarState({required this.contatos, required this.contato}) {
    nomeController.text = contato.nome;
    emailController.text = contato.email;
    telController.text = contato.tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
                errorText: nomeValido ? null : 'O nome não pode ser vazio',
              ),
              controller: nomeController,
              onChanged: (value) {
                setState(() {
                  nomeValido = value.isNotEmpty;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: emailValido
                    ? null : 'O email não pode ser vazio ou inválido',
              ),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  emailValido = value.isNotEmpty &&
                      RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Telefone',
                errorText: telValido ? null : 'Telefone inválido ou vazio',
              ),
              controller: telController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  String textoo = newValue.text;

                  if (textoo.length >= 2) {
                    textoo =
                    '(${textoo.substring(0, 2)}) ${textoo.substring(2)}';
                  }
                  if (textoo.length > 10) {
                    textoo = '${textoo.substring(0, 10)}-${textoo.substring(10, textoo.length)}';
                  }
                  return TextEditingValue(
                    text: textoo,
                    selection: TextSelection.collapsed(offset: textoo.length),
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      nomeValido = nomeController.text.isNotEmpty;
                      telValido = telController.text.isNotEmpty &&
                          telController.text
                              .replaceAll(RegExp(r'[\D]'), '')
                              .length >=
                              11;
                      emailValido = emailController.text.isNotEmpty &&
                          RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(emailController.text);
                    });

                    if (nomeValido && emailValido && telValido) {
                      Contato updatedContato = Contato(
                        id: contato.id,
                        nome: nomeController.text,
                        email: emailController.text,
                        tel: telController.text,
                      );

                      await dados.editarContato(updatedContato); // Atualiza o contato no banco de dados
                      Navigator.pop(context, true); //Retorna à tela anterior
                    }
                  },
                  child: Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => ExcluirState(contatos: contatos, contato: contato),
                    );
                  },
                  child: Text('Excluir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}