import 'package:flutter/material.dart';
import 'package:pagination/screens/widgets/pokemon_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Pokemon")),
        body: const Column(
          children: [Expanded(child: PokemonList())],
        ));
  }
}
