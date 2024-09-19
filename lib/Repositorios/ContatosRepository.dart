import '../Entidades/Contato.dart';

//Classe de repositório, que manipula os objetos de forma genérica.
class ContatosRepository {
  final List<Contato> contatos = [];  //Invoca a lista de contatos


  //Adds e getters a seguir
  void addContatos(Contato c){
    contatos.add(c);
  }
  List<Contato> getContatos(){
    return contatos;
  }
}