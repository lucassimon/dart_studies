import 'package:dio/dio.dart';

class AuthRepository {
  Dio client;
  final String baseUrl = 'http://localhost:5000';

  AuthRepository() {
    BaseOptions options = BaseOptions(baseUrl: baseUrl);
    this.client = Dio(options);
  }

  login(String email, String password) async {
    String endpoint = '/login';
    Map <String, String> payload = {
      "email": email,
      "password": password,
    };
    Response response = await client.post(endpoint, data: payload);
    return response;
  }

  refresh() async {
    String endpoint = '/refresh';
    Response response = await client.post(endpoint, data: {});
    return response;
  }

  logout() {

  }
}
