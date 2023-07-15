import 'package:dio/dio.dart';


class DioClient{
  final dio = Dio(BaseOptions(
    baseUrl: 'https://hub.dummyapis.com/',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));
}

