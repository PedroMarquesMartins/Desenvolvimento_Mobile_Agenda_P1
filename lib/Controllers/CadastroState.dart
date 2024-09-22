import 'package:desenvolvimento_mobile_p1/Repositorios/ContatosRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Entidades/Cadastro.dart';
import '../Entidades/Contato.dart';
import 'package:flutter/services.dart';

class CadastroState extends State<Cadastro> {

  //Criando instancias das incersões dos campos
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final ContatosRepository contatos;

  //Criando Variáveis de validação
  bool EmailValido = true;
  bool NomeValido = true;
  bool TelValido = true;

  CadastroState({required this.contatos});  //Construtor

  @override
  Widget build(BuildContext context) {   //Este widget deve cadastrar os usuarios, validando as entradas e salvando-as na memória
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contatos'),  //Titulo da tela
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(    //Inserindo mensagens na tela de acordo com o campo
                labelText: 'Informe o nome',
                errorText: NomeValido ? null : 'O nome não pode ser vazio', //Mensagem de Erro
              ),
              controller: nomeController,
              onChanged: (value) {
                setState(() {
                  NomeValido = value.isNotEmpty;   //Verificando se o campo é vazio
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Informe o email',  //Solicitando dados
                errorText: EmailValido
                    ? null
                    : 'O email não pode ser vazio ou inválido',
              ),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  EmailValido = value.isNotEmpty &&
                      RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);    //Fazendo a máscara para email
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Informe o telefone',
                errorText: TelValido ? null : 'Telefone inválido ou vazio',   //Mais textos de interface
              ),
              controller: telController,
              keyboardType: TextInputType.phone,   //Definindo o tipo de texto
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
                TextInputFormatter.withFunction((oldValue, newValue) {   //Diferenciando as entradas novas e antigas
                  String textoo = newValue.text;

                  //A seguir as estruturas condicionais IF farão a mascara e determinarão se a entrada é válida
                  if (textoo.length >= 2) {
                    textoo =
                        '(${textoo.substring(0, 2)}) ${textoo.substring(2)}';
                  }
                  if (textoo.length > 10) {
                    textoo =
                        '${textoo.substring(0, 10)}-${textoo.substring(10, textoo.length)}';  //Validando tamanho do numero telefonico
                  }
                  return TextEditingValue(
                    text: textoo,
                    selection: TextSelection.collapsed(offset: textoo.length),
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(        //Criando botão Salvar
              onPressed: () {
                setState(() {
                  NomeValido = nomeController.text.isNotEmpty;  //Verificando validade se não é vazio
                  TelValido = telController.text.isNotEmpty &&
                      telController.text
                              .replaceAll(RegExp(r'[\D]'), '')       //Aplicando máscara
                              .length >=
                          11;
                  EmailValido = emailController.text.isNotEmpty &&
                      RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$')      //Aplicando a máscara
                          .hasMatch(emailController.text);
                });

                //Se for válido o contato novo é salvo
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
