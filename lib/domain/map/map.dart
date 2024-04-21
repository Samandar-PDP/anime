import 'package:flutter_application_1/data/model/anime_response.dart';
import 'package:flutter_application_1/domain/model/anime.dart';

extension Map on Data {
  Anime toAnime() {
    return Anime(
        malId: malId,
        url: url,
        image: images?.jpg?.imageUrl,
        name: name,
        nameKanji: nameKanji,
        nicknames: nicknames,
        favorites: favorites,
        about: about);
  }
}
