import 'package:dio/dio.dart';
import '../../../constant/app.dart' as app;
import '../../../domain/exception/exception/dio_exception.dart';
import 'package:dartz/dartz.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: app.baseUrl,
    ));

    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Fetch Data From Endpoint : ${options.uri}');
        print('--- --- --- ---');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ));
  }

  Future<Either<Response, DioExceptions>> get(String endPoint) async {
    try {
      Response response;
      response = await _dio.get(endPoint);
      return Left(response);
    } on DioError catch (e) {
      DioExceptions errorMessage = DioExceptions.fromDioError(e);
      return Right(errorMessage);
    }
  }
}
