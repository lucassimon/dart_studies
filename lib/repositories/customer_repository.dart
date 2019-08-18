import 'package:dio/dio.dart';
import 'package:studies/http/http.dart';

class CustomerRepository {
  CustomHttp client;
  final String baseUrl = 'http://localhost:5000';

  CustomerRepository({String jwt = ''}) {
    this.client = CustomHttp(baseUrl);
  }

  fetchAll() async {
    String endpoint = '/customers';
    Response response = await client.get(endpoint);
    return response;
  }
}
