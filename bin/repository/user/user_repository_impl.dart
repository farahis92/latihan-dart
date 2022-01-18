import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/exception/exception/dio_exception.dart';
import '../../service/http_service/dio/dio_client.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  DioClient http = DioClient();

  @override
   Future findById(int id) async{
    Either<Response, DioExceptions> response = await http.get("/users/$id");
    return response;
  }
}