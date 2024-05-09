import 'dart:typed_data';
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_application_1/data/local/anime_dao.dart';
import 'package:flutter_application_1/domain/model/anime_db.dart';

part 'anime_database.g.dart';

@Database(version: 2, entities: [AnimeDb])
abstract class AnimeDatabase extends FloorDatabase {
   AnimeDao get animeDao;
}