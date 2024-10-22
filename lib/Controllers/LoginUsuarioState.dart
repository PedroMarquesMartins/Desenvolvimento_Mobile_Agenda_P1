import 'package:flutter/material.dart';
import 'package:projeto_cadastro/Controllers/CadastroUsuarioState.dart';
import 'package:projeto_cadastro/Controllers/Principal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Dao/Dados.dart';
import 'Autenticacao/Token.dart';


//classe login responsável por validar a entrada do usuário
class LoginUsuarioState extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginUsuarioState> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final Dados dados = Dados(); // Instancia a classe Dados para interações com o banco de dados
  bool loginValido = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),  //Ajustando na tela
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Usuário',
                errorText: loginValido ? null : 'Usuário ou senha inválidos', //Verificando se o login é válido, ou se está vazio
              ),
              controller: usuarioController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                errorText: loginValido ? null : 'Usuário ou senha inválidos', //Senha válida ou nula?
              ),
              controller: senhaController,
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {

                //relacionando variávies para manipulação
                String usuario = usuarioController.text;
                String senha = senhaController.text;

                //Verifica se as credenciais estão corretas
                bool isValido = await dados.validarLogin(usuario, senha);
                setState(() {
                  loginValido = isValido;
                });
                if (loginValido) {

                  //Salva o token no sharedPreferences aqui
                  bool sucesso = await salvarDados('token', usuario);

                  if (sucesso) {
                    print('Token salvo com sucesso!');
                  } else {
                    print('Falha ao salvar o token.');
                  }

                  //Para a tela principal
                  Navigator.pushReplacement(
                    context,

                    MaterialPageRoute(builder: (context) => Principal()),
                  );
                }
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {

                //Tela de cadastro state
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroUsuarioState()),

                );
              },
              child: Text('Cadastrar Novo Usuário'),

            ),
          ],
        ),
      ),
    );
  }
}
