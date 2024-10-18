class Contato {
  final int? id;
  final String nome;
  final String email;
  final String tel;

  Contato({this.id, required this.nome, required this.email, required this.tel});

  factory Contato.fromMap(Map<String, dynamic> map) {
    return Contato(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      tel: map['tel'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'tel': tel,
    };
    @override
    String toString() {
      return 'Contato{id: $id, nome: $nome, email: $email, tel: $tel}';
    }
  }
}
