import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pagination/model/pokemon.dart';

class PokemonService {
  final String baseUrl = "https://pokeapi.co/api/v2/pokemon";

  Future<Map<String, dynamic>> getPage(int offset, int limit) async {
    final response =
        await http.get(Uri.parse('$baseUrl?offset=$offset&limit=$limit'));
    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseMap = json.decode(response.body);
      List<Pokemon> results = responseMap["results"]
          .map<Pokemon>((map) => Pokemon.fromJson(map))
          .toList();
      return {'results': results, 'next': responseMap['next']};
    } else {
      throw Exception('Error fetching data: ${response.statusCode}');
    }
  }
}
