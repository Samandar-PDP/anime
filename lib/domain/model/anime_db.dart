import 'dart:typed_data';

import 'package:floor/floor.dart';

@entity // table
class AnimeDb {
  @PrimaryKey(autoGenerate: true) // o'zgarmaydigan id'si
  int? id;
  int? animeId;
  String? name;
  String? nameKanji;
  String? nickName;
  String? about;
  Uint8List? imageData;

  AnimeDb({this.id, this.animeId, this.name, this.nameKanji, this.nickName, this.about, required this.imageData}); // constructor

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is AnimeDb &&
        other.id == id &&
        other.animeId == animeId &&
        other.name == name &&
        other.nameKanji == nameKanji &&
        other.nickName == nickName &&
        other.about == about && other.imageData == imageData; //
  }

  @override
  int get hashCode {
    return id.hashCode ^
    animeId.hashCode ^
    name.hashCode ^
    nameKanji.hashCode ^
    nickName.hashCode ^
    imageData.hashCode ^
    about.hashCode;
  }

  @override
  String toString() {
    return 'AnimeDb{id: $id, animeId: $animeId, name: $name, nameKanji: $nameKanji, nickName: $nickName, about: $about, imageData: $imageData}';
  }
}
