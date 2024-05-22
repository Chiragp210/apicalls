import 'package:dio/dio.dart';

class DioClass{
  static Dio createDio() {
    final BaseOptions options = BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/'
    );
    final Dio dio = Dio(options);
    return dio;
  }
}