import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:projeto_cadastro/Entidades/Usuario.dart';

class SecuredStorage{
  String geraToken(Usuario u){
    const secret = 'tokenSecret';
    print("GERA TOKEN NO SECURESTORAGE");
    final jwt = JWT(
      {
        'name':u.usuario,
        'senha':u.senha,
      },
    );

    final token = jwt.sign(SecretKey(secret), algorithm: JWTAlgorithm.HS256);
    return token;
  }

  static bool verifyToken(String token){
    const secret = 'tokenSecret';
    print("PASSOU PELO VERIFICA TOKEN");
    try{
      final jwt = JWT.verify(token, SecretKey(secret));
      print('O Token é válido. Payload: ${jwt.payload}');
      return jwt.payload != null?true:false;
    }on JWTExpiredException{
      print('jwt expired');
    }on JWTException catch(ex){
      print (ex.message);
    }
    return false;
  }
}