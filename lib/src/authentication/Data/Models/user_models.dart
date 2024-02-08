

import 'dart:convert';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/authentication/Domain/entities/user.dart';

class UserModel extends User{

  const UserModel({required super.id, required super.name, required super.avatar, required super.createdAt});
  factory UserModel.fromJson(String source) => UserModel.fromMap(jsonDecode(source) as DataMap);
  const UserModel.empty() : this(id: 'empty.id', createdAt: "empty.createdAt", name: "empty.name", avatar: "empty.avatar");


  UserModel copyWith({
    String? id, String? name,
    String? avatar, String? createdAt,}) =>
     UserModel(
       id: id ?? this.id, name: name ?? this.name,
      avatar: avatar ?? this.avatar, createdAt: createdAt ?? this.createdAt,);


  UserModel.fromMap(DataMap map) : this(
      id: map['id'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
      createdAt: map['createdAt'] as String
  );

  DataMap toMap() => {
    'id': id,
    'name': name,
    'avatar': avatar,
    'createdAt': createdAt,
  };

  String toJson() => jsonEncode(toMap());

}