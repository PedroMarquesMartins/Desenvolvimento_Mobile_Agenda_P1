import 'package:shared_preferences/shared_preferences.dart';

// Função para salvar dados
Future<bool> salvarDados(String chave, String valor) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(chave, valor);
    return true;
  } catch (e) {
    print('Erro ao salvar dados: $e');
    return false;
  }
}

// Função para carregar dados
Future<String?> carregarDados(String chave) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(chave);
}

// Função para remover dados
Future<void> removerDados(String chave) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(chave);
}
