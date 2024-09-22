import '../Entidades/Contato.dart';

//Classe de repositório, que manipula os objetos de forma genérica.
class ContatosRepository {
  List<Contato> _contatos = [];

  List<Contato> getContatos() {
    return _contatos;      //Retorna os contatos
  }

  void addContatos(Contato contato) {  //Adiciona contatos
    _contatos.add(contato);
  }

  void atualizarContato(Contato oldContato, Contato newContato) {   //Atualizando na tela os dados novos
    final index = _contatos.indexOf(oldContato);
    if (index != -1) {
      _contatos[index] = newContato;
    }
  }
}