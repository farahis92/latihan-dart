import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'domain/exception/exception/dio_exception.dart';
import 'domain/response/user_response.dart';
import 'repository/user/user_repository_impl.dart';

void main(List<String> arguments) async {
  UserRepositoryImpl userRepository = UserRepositoryImpl();

  Either<Response, DioExceptions> request = await userRepository.findById(1);
  request.fold(
    (response) {
      UserResponse userResponse = UserResponse.fromJson(response.data);
      print(userResponse.data.firstName);
      print(userResponse.data.lastName);
      print(userResponse.data.email);
      print(userResponse.data.avatar);
      print(userResponse.support.text);
      print(userResponse.support.url);
    },
    (exception) {
      print(exception.code);
      print(exception.message);
    },
  );
}