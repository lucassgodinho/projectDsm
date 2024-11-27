import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/character.dart';

class ApiService {
  Future<List<Character>> getCharacters() async {
    try {
      final response = await http.get(Uri.parse('https://dragonball-api.com/api/characters'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body)["items"];
        print(jsonResponse);
        return jsonResponse.map((item) => Character.fromJson(item)).toList();
      } else {
        throw Exception('Falha ao carregar personagens');
      }
    } catch (e) {
      throw Exception('Erro ao buscar personagens: $e');
    }
  }
}