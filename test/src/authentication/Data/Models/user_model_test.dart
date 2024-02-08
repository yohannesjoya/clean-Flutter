//depend - nothing

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/authentication/Data/Models/user_models.dart';
import 'package:tdd_clean/src/authentication/Domain/entities/user.dart';

import '../../../../fixture/fixture_reader.dart';

void main(){

  const tUserModel = UserModel.empty();

  test('UserModel must be a subclass of [User] entity', () {
    expect(tUserModel, isA<User>());
  });

  final tUserJson = fixture('user.json');
  final tUserMap = jsonDecode(tUserJson) as DataMap;

  group('fromMap', () {

    test('should return a [UserModel] with correct data', () {

      final result = UserModel.fromMap(tUserMap);
      expect(result, equals(tUserModel));
    });

  });

  group('fromJson', () {

    test('should return a [UserModel] with correct data', () {

      final result = UserModel.fromJson(tUserJson);
      expect(result, equals(tUserModel));
    });
  });

  group('toMap', () {
    test('should return a [UserModelMap] with correct data', () {

      final result = tUserModel.toMap();
      expect(result, equals(tUserMap));
    });
  });

  group('toJson', () {
    test('should return a [UserModelJson] with correct data', () {

      final result = tUserModel.toJson();
      expect(result, equals(tUserJson));
    });
  });

  group('copyWith', () {
    test('should return a [UserModel] with correct [name] changes', () {
      final result = tUserModel.copyWith(name: "test_name");
      expect(result.name, equals("test_name"));
    });

    test('should return a [UserModel] with correct [avatar] changes', () {
      final result = tUserModel.copyWith(avatar: "test_avatar");
      expect(result.avatar, equals("test_avatar"));
    });

    test('should return a [UserModel] with correct [createdAt] changes', () {
      final result = tUserModel.copyWith(createdAt: "test_createdAt");
      expect(result.createdAt, equals("test_createdAt"));
    });

    test('should return a [UserModel] with correct [id] changes', () {
      final result = tUserModel.copyWith(id: "test_id");
      expect(result.id, equals("test_id"));
    });
  });
}
