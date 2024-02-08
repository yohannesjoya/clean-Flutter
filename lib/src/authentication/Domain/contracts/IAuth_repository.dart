import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/authentication/Domain/entities/user.dart';


abstract class IAuthRepository{

  const IAuthRepository();

  // register new user
  ResultVoid createUser({required String name, required String avatar, required String createdAt,});

  // gets a list of all users
  ResultFuture<List<User>> getAllUsers();

}