import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repository/local_repository_impl.dart';

class IntroProvider extends ChangeNotifier {
  static final _repo = LocalRepositoryImpl();

  Future<bool> get state => _repo.isFirstTime(); // 1

  bool introState = false; // 2

  void getState() async {
    introState = await _repo.isFirstTime(); // 2
    notifyListeners();
  }

  void _saveState(bool state) async {
   await _repo.saveIntro(state);
  }
}