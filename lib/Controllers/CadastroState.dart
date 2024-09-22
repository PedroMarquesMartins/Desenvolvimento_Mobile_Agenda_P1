import 'package:desenvolvimento_mobile_p1/Repositorios/ContatosRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Entidades/Cadastro.dart';
import '../Entidades/Contato.dart';
import 'package:flutter/services.dart';

class CadastroState extends State<Cadastro> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final ContatosRepository contatos;
  bool EmailValido = true;
  bool NomeValido = true;
  bool TelValido = true;

  CadastroState({required this.contatos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contatos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Informe o nome',
                errorText: NomeValido ? null : 'O nome não pode ser vazio',
              ),
              controller: nomeController,
              onChanged: (value) {
                setState(() {
                  NomeValido = value.isNotEmpty;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Informe o email',
                errorText: EmailValido
                    ? null
                    : 'O email não pode ser vazio ou inválido',
              ),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  EmailValido = value.isNotEmpty &&
                      RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Informe o telefone',
                errorText: TelValido ? null : 'Telefone inválido ou vazio',
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
                    textoo =
                        '${textoo.substring(0, 10)}-${textoo.substring(10, textoo.length)}';
                  }
                  return TextEditingValue(
                    text: textoo,
                    selection: TextSelection.collapsed(offset: textoo.length),
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  NomeValido = nomeController.text.isNotEmpty;
                  TelValido = telController.text.isNotEmpty &&
                      telController.text
                              .replaceAll(RegExp(r'[\D]'), '')
                              .length >=
                          11;
                  EmailValido = emailController.text.isNotEmpty &&
                      RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(emailController.text);
                });

                if (NomeValido && EmailValido && TelValido) {
                  setState(() {
                    contatos.addContatos(Contato(
                      nome: nomeController.text,
                      email: emailController.text,
                      tel: telController.text,
                    ));
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
