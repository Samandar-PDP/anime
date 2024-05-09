import 'package:flutter_application_1/data/local/anime_dao.dart';
import 'package:flutter_application_1/data/local/anime_database.dart';
import 'package:flutter_application_1/data/local/cache_manager.dart';
import 'package:flutter_application_1/domain/model/anime_db.dart';
import 'package:flutter_application_1/domain/repository/local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  final _cache = CacheManager();

  AnimeDao? _dao;

  @override
  Future<void> init() async {
    final database =
        await $FloorAnimeDatabase.databaseBuilder("anime.db").build();
    _dao = database.animeDao;
  }

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
    await _dao?.clearAnimeList();
  }

  @override
  Future<void> deleteFavoriteAnime(AnimeDb anime) async {
    await _dao?.deleteAnime(anime);
  }

  @override
  Future<AnimeDb?> findAnimeById(int id) async {
    final database =
    await $FloorAnimeDatabase.databaseBuilder("anime.db").build();
    _dao = database.animeDao;
    print('find anime id');
    return await _dao?.findAnimeById(id);
  }

  @override
  Stream<List<AnimeDb>>? getFavoriteAnimeList() => _dao?.getAllAnimeList();

  @override
  Future<void> saveFavoriteAnime(AnimeDb anime) async {
    final database =
    await $FloorAnimeDatabase.databaseBuilder("anime.db").build();
    _dao = database.animeDao;
    await _dao?.saveAnime(anime);
  }
}
