import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/repository/local_repository_impl.dart';
import 'package:flutter_application_1/domain/model/anime_db.dart';

class BmProvider extends ChangeNotifier {
  final _local = LocalRepositoryImpl();
 // final List<AnimeDb> animeList = [];

  Stream<List<AnimeDb>>? fetchLocalAnimeList() => _local.getFavoriteAnimeList();
}