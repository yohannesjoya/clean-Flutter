
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';

class LessonRequestEntity {
  int? id;

  LessonRequestEntity({
    this.id,
  });

  DataMap toJson() => {
    "id": id,
  };
}


class LessonListResponseEntity {
  int? code;
  String? msg;
  List<LessonItem>? data;

  LessonListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory LessonListResponseEntity.fromJson(DataMap json) =>
      LessonListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<LessonItem>.from(json["data"].map((x) => LessonItem.fromJson(x))),
      );
}

//api post response msg
class LessonDetailResponseEntity {
  int? code;
  String? msg;
  List<LessonVideoItem>? data;

  LessonDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });


  factory LessonDetailResponseEntity.fromJson(DataMap json) =>
      LessonDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<LessonVideoItem>.from(json["data"].map((x) => LessonVideoItem.fromJson(x))),
      );
}

// login result
class LessonItem {
  String? name;
  String? description;
  String? thumbnail;
  int? id;

  LessonItem({
    this.name,
    this.description,
    this.thumbnail,
    this.id,
  });

  factory LessonItem.fromJson(DataMap json) =>
      LessonItem(
        name: json["name"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        id: json["id"],
      );

  DataMap toJson() => {
    "name": name,
    "description": description,
    "thumbnail": thumbnail,
    "id": id,
  };
}

class LessonVideoItem {
  String? name;
  String? url;
  String? thumbnail;

  LessonVideoItem({
    this.name,
    this.url,
    this.thumbnail,
  });

  factory LessonVideoItem.fromJson(DataMap json) =>
      LessonVideoItem(
        name: json["name"],
        url: json["url"],
        thumbnail: json["thumbnail"],
      );

  DataMap toJson() => {
    "name": name,
    "url": url,
    "thumbnail": thumbnail,
  };

}

