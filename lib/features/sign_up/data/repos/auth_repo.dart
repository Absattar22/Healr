import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<String, Map<String, dynamic>>> creatAnAccount(
      {required Map<String, dynamic> data});
}
