import 'package:flutter/material.dart';
import 'package:pagination/model/pokemon.dart';
import 'package:pagination/screens/widgets/pokemon_card.dart';
import 'package:pagination/services/pokemon_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final PokemonService _pokemonService = PokemonService();
  static const _pageSize = 20;
  final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _pokemonService.getPage(pageKey, _pageSize);
      final isLastPage = newItems['next'] == null;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems['results']);
      } else {
        final nextPageKey = pageKey + _pageSize;
        _pagingController.appendPage(newItems['results'], nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, Pokemon>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Pokemon>(
        itemBuilder: (context, item, index) {
          return PokemonCard(pokemon: item);
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}
