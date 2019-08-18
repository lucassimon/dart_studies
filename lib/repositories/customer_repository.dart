import 'package:dio/dio.dart';
import 'package:studies/http/http.dart';
import 'package:studies/storages/storages.dart';

class CustomerRepository {
  CustomHttp client;
  Storage _storage;
  final String baseUrl = 'http://localhost:5000';

  CustomerRepository(dynamic storageAdapter) {
    this._storage = Storage(storageAdapter);
    this.client = CustomHttp(baseUrl, this._storage);
  }

  fetchAll() async {
    String endpoint = '/customers';
    Response response = await client.get(endpoint);
    return response;
  }
}
