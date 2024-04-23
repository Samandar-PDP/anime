import 'package:flutter_application_1/data/local/cache_manager.dart';
import 'package:flutter_application_1/domain/repository/local_repository.dart';

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
}