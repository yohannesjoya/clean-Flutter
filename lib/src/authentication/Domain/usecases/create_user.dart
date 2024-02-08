import 'package:equatable/equatable.dart';
import 'package:tdd_clean/core/usecases/usecase.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/authentication/Domain/contracts/IAuth_repository.dart';

class CreateUser extends UseCaseWithPrams<void, CreateUserParams> {

  final IAuthRepository _authRepository;
  const CreateUser(this._authRepository);

  @override
  ResultVoid call(CreateUserParams params)
  async => _authRepository.createUser(name: params.name, avatar: params.avatar, createdAt: params.createdAt) ;

}

class CreateUserParams extends Equatable{
  final String name;
  final String avatar;
  final String createdAt;

  const CreateUserParams({required this.name,required this.avatar, required this.createdAt});

  const CreateUserParams.empty() : this( createdAt: "empty.createdAt", name: "empty.name", avatar: "empty.avatar");

  @override
  List<Object?> get props => [name,avatar,createdAt];
}



//! this as how you use it without the base usecases
// ResultVoid createUser({required String name, required String avatar, required String createdAt}) async
//   => _authRepository.createUser(name: name, avatar: avatar, createdAt: createdAt);