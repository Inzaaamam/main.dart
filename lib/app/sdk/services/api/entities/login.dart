import 'package:dio/dio.dart';

import 'base.dart';

class SignInApi {
  SignInApi();
  Future<Map<String, dynamic>> signIn(Map<String, dynamic> data) async {
    try {
      final response = await Base.dio.post('auth/signin', data: data);
      print('Token : ${response.data['response']['token'].toString()}');
      return response.data['response'];
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
