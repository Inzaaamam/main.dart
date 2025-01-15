import 'package:dio/dio.dart';

class Base {
  static const String _baseurl = 'https://devapi.falaya.com/api/';
  static const String _prod = '';
  static const connectTimeOut = 1600;
  static const receivedTimeOut = 1600;
  static const senderTimeOut = 1600;
  static get baseUrl => _baseurl;
  static final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: connectTimeOut),
    receiveTimeout: const Duration(seconds: receivedTimeOut),
    sendTimeout: const Duration(seconds: senderTimeOut),
  ));
  // ..interceptors.addAll([
  //   InterceptorsWrapper(onRequest: (options, handler) {
  //     handler.next(options);
  //   }, onResponse: (options, handler) {
  //     handler.next(options);
  //   }, onError: (options, error) {
  //     return error.next(options);
  //   }),
  //   LogInterceptor()
  // ]);
}
