//A classe contato é uma entidade simples que inicia as variáveis de contato
class Contato{
  final String nome;
  final String email;
  final String tel;

  //O contato é indicado para receber estes dados seguintes, seguido do REQUIRED que indica obrigatoriedade.
  Contato({required this.nome, required this.email, required this.tel});
}