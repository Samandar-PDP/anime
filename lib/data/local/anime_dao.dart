import 'package:floor/floor.dart';
import '../../domain/model/anime_db.dart';

@dao
abstract class AnimeDao {
  @Query("SELECT * FROM anime_db WHERE animeId = :id") //
  Future<AnimeDb?> findAnimeById(int id);// id = animeId

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> saveAnime(AnimeDb db);

  @Query("SELECT * FROM anime_db")
  Stream<List<AnimeDb>> getAllAnimeList();

  @delete
  Future<void> deleteAnime(AnimeDb anime);

  @Query("DELETE FROM anime_db")
  Future<void> clearAnimeList();
}