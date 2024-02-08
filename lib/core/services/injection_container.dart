import 'package:get_it/get_it.dart';
import 'package:tdd_clean/src/Records/Data/DataSource/remote.dart';
import 'package:tdd_clean/src/Records/Data/repository/record_repository.dart';
import 'package:tdd_clean/src/Records/Domain/contracts/IRecord_repository.dart';
import 'package:tdd_clean/src/Records/Domain/usecases/add_record.dart';
import 'package:tdd_clean/src/Records/Presentation/cubit/record_cubit.dart';
import 'package:tdd_clean/src/authentication/Data/datasources/remote.dart';
import 'package:tdd_clean/src/authentication/Data/repository/auth_repository.dart';
import 'package:tdd_clean/src/authentication/Domain/contracts/IAuth_repository.dart';
import 'package:tdd_clean/src/authentication/Domain/usecases/create_user.dart';
import 'package:tdd_clean/src/authentication/Domain/usecases/get_all_users.dart';
import 'package:tdd_clean/src/authentication/Presentation/Bloc/signin/sign_In_bloc.dart';
import 'package:tdd_clean/src/authentication/Presentation/Bloc/signup/sign_up_bloc.dart';
import 'package:tdd_clean/src/authentication/Presentation/cubit/auth_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:tdd_clean/src/on_boarding/Presentation/Bloc/on_boarding_bloc.dart';

final sl = GetIt.instance;


Future<void> init () async {

  // App logic => use cases Domain => Repository => Data layer => External layer

  sl..registerFactory( () => AuthCubit(createUserUC: sl(), getAllUsersUC: sl()) )
    ..registerLazySingleton( () => CreateUser(sl()) )
    ..registerLazySingleton( () => GetAllUsers(sl()) )
    ..registerLazySingleton<IAuthRepository>(()=> AuthRepository(sl()) )
    ..registerLazySingleton<IAuthRemoteDataSource>(()=> AuthRemoteDataSource(sl()))
    ..registerLazySingleton(http.Client.new);

  sl.registerFactory( () => SignInBloc(createUserUC: sl(), getAllUsersUC: sl()));

  sl..registerFactory(() => RecordCubit(addRecordUC: sl()))
      ..registerLazySingleton(() => AddRecord(sl()))
      ..registerLazySingleton<IRecordRepository>( () => RecordRepository(sl()) )
      ..registerLazySingleton<IRecordRemoteDataSource>(() => RecordRemoteDataSource(sl()))
      ..registerLazySingleton(() => http.Client.new);

  sl.registerFactory(() => SignUpBloc());

  sl.registerFactory(() => OnBoardingBloc());

}