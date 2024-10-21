import 'package:flutter/material.dart';
import '../Dao/Dados.dart';
import '../Entidades/Usuario.dart';

//Classe CadastroUsuarioState insere os dados do novo usuario no banco
class CadastroUsuarioState extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuarioState> {

  //Preenchendo variaveis de manipulação
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final Dados dados = Dados();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Usuário')), //Titulo
      body: Padding(
        padding: const EdgeInsets.all(20.0),  //Aqui eu ajusto padding
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Usuário',
              ),
              controller: usuarioController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              controller: senhaController,
              obscureText: true,   //Decorando o campo
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {

                //Relacionando á novas variaveis para manipulação
                String usuario = usuarioController.text;
                String senha = senhaController.text;

                if (usuario.isNotEmpty && senha.isNotEmpty) {  //Se for válido, dados chama a função de cadastrar
                  Usuario novoUsuario = Usuario(usuario: usuario, senha: senha);
                  await dados.cadastrarUsuario(novoUsuario);

                  Navigator.pop(context); //Volta para a tela de login
                }
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
