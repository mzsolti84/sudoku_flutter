import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../environment.dart';

@module
abstract class NetworkModule{
  @singleton
  Dio dio(AppEnvironment app) {
    var dio = Dio();
    dio.options.baseUrl = app.userBaseUrl;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      responseHeader: true,
    ));
    return dio;
  }
}