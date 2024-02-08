
import 'package:tdd_clean/core/utils/typedefs.dart';

class BaseResponseEntity {
  int? code;
  String? msg;
  String? data;

  BaseResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory BaseResponseEntity.fromJson(DataMap json) =>
      BaseResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"],
      );

  DataMap toJson() => {
    "counts": code ,
    "msg": msg ,
    "items": data,
  };
}

class BindFcmTokenRequestEntity {
  String? fcmtoken;

  BindFcmTokenRequestEntity({
    this.fcmtoken,
  });

  DataMap toJson() => {
    "fcmtoken": fcmtoken,
  };
}