import 'package:dartz/dartz.dart';
import 'package:tdd_clean/core/errors/exceptions.dart';
import 'package:tdd_clean/core/errors/failure.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/authentication/Data/datasources/remote.dart';
import 'package:tdd_clean/src/authentication/Domain/contracts/IAuth_repository.dart';
import 'package:tdd_clean/src/authentication/Domain/entities/user.dart';

class AuthRepository implements IAuthRepository{

  final IAuthRemoteDataSource _authRemoteDataSource;
  const AuthRepository(this._authRemoteDataSource);

  @override
  ResultVoid createUser({required String name, required String avatar, required String createdAt}) async {

      try{
        await _authRemoteDataSource.createUser(name: name, avatar: avatar, createdAt: createdAt);
        return const Right(null);
      } on APIException catch(e){
        return Left(APIFailure.fromException(e));
      }
    }

  @override
  ResultFuture<List<User>> getAllUsers() async {

    try{
      final usersList = await _authRemoteDataSource.getAllUsers();
      return Right(usersList);
    }

    on APIException catch(e){
      return Left(APIFailure.fromException(e));
    }
  }

}