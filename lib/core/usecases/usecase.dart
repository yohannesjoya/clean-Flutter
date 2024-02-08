import 'package:tdd_clean/core/utils/typedefs.dart';

abstract class UseCaseWithPrams<Type,Params> {
  const UseCaseWithPrams();
  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type>{
  const UseCaseWithoutParams();
  ResultFuture<Type> call();
}