import 'package:flutter/material.dart';
import 'package:pagination/model/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Expanded(
          child: Image.network(pokemon.imageUrl),
        ),
        Text(pokemon.capitalizedName),
      ],
    ));
  }
}
