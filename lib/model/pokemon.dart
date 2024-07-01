class Pokemon {
  final String name;
  final String url;
  final String imageUrl;

  const Pokemon(
      {required this.name, required this.url, required this.imageUrl});

  Pokemon.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'],
        imageUrl =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['url'].split('/')[6]}.png";

  String get capitalizedName {
    return name[0].toUpperCase() + name.substring(1);
  }
}
