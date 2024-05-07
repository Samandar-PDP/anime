import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/repository/local_repository_impl.dart';
import 'package:flutter_application_1/domain/model/anime.dart';
import 'package:flutter_application_1/domain/repository/local_repository.dart';

class DetailProvider extends ChangeNotifier {
  final LocalRepository _localRepository = LocalRepositoryImpl();
  bool isSaved = false;

  init() async {
    await _localRepository.init();
  }
  void checkSavedOrNot(int id) async {
    final anime = await _localRepository.findAnimeById(id);
    isSaved = anime != null;
    notifyListeners();
  }
  void saveOrDelete(Anime anime) async {
    if(isSaved) {
      await _localRepository.deleteFavoriteAnime(anime.toLocalAnime());
      isSaved = false;
    } else {
      await _localRepository.saveFavoriteAnime(anime.toLocalAnime());
      isSaved = true;
    }
    notifyListeners();
  }
}
