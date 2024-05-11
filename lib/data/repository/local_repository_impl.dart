import 'package:flutter_application_1/data/local/cache_manager.dart';
import 'package:flutter_application_1/domain/model/anime_db.dart';
import 'package:flutter_application_1/domain/repository/local_repository.dart';
import 'package:flutter_application_1/util/initializer.dart';

class LocalRepositoryImpl extends LocalRepository {
  final _cache = CacheManager();

  @override
  Future<bool> isFirstTime() async {
    return _cache.getIntroState();
  }

  @override
  Future<void> saveIntro(bool firstTime) async {
    await _cache.saveIntroState(firstTime);
  }

  @override
  Future<void> clearFavorites() async {
    await Initializer.dao?.clearAnimeList();
  }

  @override
  Future<void> deleteFavoriteAnime(AnimeDb anime) async {
    await Initializer.dao?.deleteAnime(anime);
  }

  @override
  Future<AnimeDb?> findAnimeById(int id) async {
    return await Initializer.dao?.findAnimeById(id);
  }

  @override
  Stream<List<AnimeDb>>? getFavoriteAnimeList() => Initializer.dao?.getAllAnimeList();

  @override
  Future<void> saveFavoriteAnime(AnimeDb anime) async {
    await Initializer.dao?.saveAnime(anime);
  }
}
