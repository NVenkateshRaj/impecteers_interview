import 'package:dio/dio.dart';

class ApiService {
  static const _baseUrl = "https://reqres.in/";
  static const _connectionTimeout = 10000;
  static const _receiveTimeout = 10000;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(milliseconds: _connectionTimeout),
      receiveTimeout: const Duration(milliseconds: _receiveTimeout),
    ),
  );

  Dio? _instance;
  //method for getting dio instance
  Dio? getInstance() {
    _instance ??= createDioInstance();
    return _instance;
  }

  Dio? createDioInstance() {
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (Response? response, handler) {
      if (response != null) {
        return handler.next(response);
      } else {
        return;
      }
    }, onError: (DioError e, handler) async {
      if (e.response != null) {
        if (e.response?.statusCode == 401) {
          handler.next(e);
        }
      }
    }));
    return _dio;
  }


  Future<dynamic> get(String path, {dynamic body}) async {
    try {
      String baseUrls = _baseUrl + path;
      Dio localDio = _dio;
      Response response = await localDio.get(baseUrls, queryParameters: body);
      var createResponse = response.data;
      return createResponse;
    } on DioException catch (e) {
      print("Exception is $e");
    }
  }

}