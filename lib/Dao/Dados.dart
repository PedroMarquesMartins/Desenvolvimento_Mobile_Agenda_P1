
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Entidades/Contato.dart';
import '../Entidades/Usuario.dart';


class Dados {
  Future<Database> initializeDB() async {
    String path = join(await getDatabasesPath(), 'meu_banco.db');
    return await openDatabase(path, onCreate: (db, version) {
      db.execute(
        "CREATE TABLE contato(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, tel TEXT)",
      );
      db.execute( //Nova query para usuario de login
        "CREATE TABLE usuario(id INTEGER PRIMARY KEY AUTOINCREMENT, usuario TEXT, senha TEXT)", // Tabela de login
      );
    }, version: 1);
  }

  Future<void> inserirUsuario(Contato contato) async {
    final Database db = await initializeDB();
    await db.insert('contato', contato.toMap());
  }

  Future<List<Contato>> obterContato() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('contato');
    return List.generate(maps.length, (i) {
      return Contato.fromMap(maps[i]);
    });
  }

  // Função para remover contato
  Future<void> removerContato(int id) async {
    final db = await initializeDB();
    await db.delete(
      'contato',
      where: 'id = ?', //Deleta o contato com base no ID
      whereArgs: [id],
    );
  }

  // Função para editar contato
  Future<void> editarContato(Contato contato) async {
    final db = await initializeDB();
    await db.update(
      'contato',
      contato.toMap(), //Atualiza o contato com os novos valores
      where: 'id = ?',
      whereArgs: [contato.id],
    );
  }

  //Nova função para cadastrar novos usuários que será chamada no CadastroUsuarioState()
  Future<void> cadastrarUsuario(Usuario usuario) async {
    final Database db = await initializeDB();
    await db.insert('usuario', usuario.toMap());

  }

  //Função para buscar no banco os dados indicados, que retorna obrigatoriamente o resultado
  Future<bool> validarLogin(String usuario, String senha) async {
    final Database db = await initializeDB();

    //Inserção da query no banco
    final List<Map<String, dynamic>> exito = await db.query(
      'usuario',
      where: 'usuario = ? AND senha = ?',
      whereArgs: [usuario, senha],
    );
    return exito.isNotEmpty;
  }
}
