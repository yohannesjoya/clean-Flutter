import 'package:tdd_clean/core/usecases/usecase.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/authentication/Data/datasources/remote.dart';
import 'package:tdd_clean/src/authentication/Data/repository/auth_repository.dart';
import 'package:tdd_clean/src/authentication/Domain/contracts/IAuth_repository.dart';
import 'package:tdd_clean/src/authentication/Domain/entities/user.dart';

import 'package:http/http.dart' as http;

class GetAllUsers extends UseCaseWithoutParams<List<User>> {

  final IAuthRepository _authRepository;

  const GetAllUsers(this._authRepository);

  @override
  ResultFuture<List<User>> call() async => _authRepository.getAllUsers();

}
