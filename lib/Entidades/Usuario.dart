class Usuario {
  final int? id;
  final String usuario;
  final String senha;

  Usuario({this.id, required this.usuario, required this.senha});


  static Usuario fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      usuario: map['usuario'],
      senha: map['senha'],
    );
  }
  //Relacionando itens de usuario
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuario': usuario,
      'senha': senha,
    };
  }

}
