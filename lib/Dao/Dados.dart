
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Entidades/Contato.dart';


class Dados {
  Future<Database> initializeDB() async {
    String path = join(await getDatabasesPath(), 'meu_banco.db');
    return await openDatabase(path, onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE contato(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, tel TEXT)",
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
}
