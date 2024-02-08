 // {"createdAt":"2023-12-24T02:38:11.497Z","name":"Sidney Osinski","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/494.jpg","id":"1"}

import 'package:equatable/equatable.dart';

class User extends Equatable {

  final String id;
  final String name;
  final String avatar;
  final String createdAt;

  const User({required this.id,required this.name,required this.avatar, required this.createdAt});

  const User.empty() : this(id: 'empty.id', createdAt: "empty.createdAt", name: "empty.name", avatar: "empty.avatar");

  @override
  List<Object?> get props => [id,name,avatar];

}





 // @override
 // bool operator == (other){
 //
 // return identical(this, other) ||
 // other is User &&
 // runtimeType == other.runtimeType &&
 // other.id == id &&
 // other.name == name;
 // }
 // @override
 // int get hashCode => id.hashCode ^ name.hashCode;