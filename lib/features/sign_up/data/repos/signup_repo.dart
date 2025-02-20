import 'package:dartz/dartz.dart';

abstract class SignUpRepo {
  Future<Either<String, Map<String, dynamic>>> signUp(
      {required Map<String, dynamic> data});
}
