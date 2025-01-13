import 'base.dart';

class SignUpApi {
  SignUpApi();

  Future<Map<String, dynamic>> signUp(Map<String, dynamic> data) async {
    try {
      final response = await Base.dio.post('auth/signup', data: data);
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
