import '../Entidades/Contato.dart';

//Classe de repositório, que manipula os objetos de forma genérica.
class Contatosrepository {
  final List<Contato> contatos = [];  //Invoca a lista de contatos


  //Adds e getters a seguir
  void addContatos(Contato c){
    contatos.add(c);
  }
  List<Contato> getContatos(){
    return contatos;
  }
}