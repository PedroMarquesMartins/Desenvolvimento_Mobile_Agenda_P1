import 'package:flutter/material.dart';
import '../Controllers/Autenticacao/SecureStorage.dart';
import '../Controllers/Autenticacao/SecureStorageAux.dart';
//import '../Controllers/Autenticacao/Token.dart';
import '../Controllers/Principal.dart';
import '../Controllers/LoginUsuarioState.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: _verificarTokenExistente(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return Principal(); //Vai para a tela principal se o token for válido
          } else {
            return LoginUsuarioState(); //Vai para o login se o token for inválido ou inexistente
          }
        },
      ),
    );
  }

  Future<bool> _verificarTokenExistente()async{
    final token = await _recuperarTokenSalvo();
    return token != null && SecuredStorage.verifyToken(token);
  }
  Future<String?> _recuperarTokenSalvo() async{
    return await SecureStorageAux.getToken();
  }
}