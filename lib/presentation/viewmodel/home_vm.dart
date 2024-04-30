import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/repository/network_repository_impl.dart';
import 'package:flutter_application_1/domain/repository/network_repository.dart';

import '../../domain/model/anime.dart';

class HomeViewModel extends ChangeNotifier {
  final NetworkRepository _repo = NetworkRepositoryImpl();
  final List<Anime> animeList = [];
  final List<Anime> animeList2 = [];
  final List<Anime> animeList3 = [];

  void fetchAnimeList() async {
    final list = await _repo.getAnimeList(1);
    final list2 = await _repo.getAnimeList(2);
    final list3 = await _repo.getAnimeList(3);
    animeList.addAll(list);
    animeList2.addAll(list2);
    animeList3.addAll(list3);
    notifyListeners();
  }
}