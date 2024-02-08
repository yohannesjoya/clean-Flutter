import 'package:equatable/equatable.dart';
import 'package:tdd_clean/core/errors/exceptions.dart';

abstract class Failure extends Equatable{

  final String message;
  final int statusCode;

  const Failure({required this.message, required this.statusCode});

  String get errorMessage => '$statusCode #ERROR: $message';

  @override
  List<Object?> get props => [message,statusCode];

}


class APIFailure extends Failure{

  const APIFailure({required super.message, required super.statusCode});
  APIFailure.fromException(APIException e) : this(message: e.message, statusCode: e.statusCode);


}
