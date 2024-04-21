import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/repository/network_repository_impl.dart';
import 'package:flutter_application_1/domain/repository/network_repository.dart';

import '../../domain/model/anime.dart';

class HomeViewModel extends ChangeNotifier {
  final NetworkRepository _repo = NetworkRepositoryImpl();
  final List<Anime> animeList = [];

  void fetchAnimeList() async {
    final list = await _repo.getAnimeList();
    animeList.addAll(list);
    notifyListeners();
  }
}