import 'package:dio/dio.dart';
import 'package:studies/repositories/customer_repository.dart';

// Authenticate in API Rest Client that response a jwt token. This will use
// interceptors to refresh tokens

void main() async {

  Map<String, String> signIn = await authenticate('test@gmail.com', 'teste123');

  // save to LocalStorage or Shared Or ...
  print(signIn);

  print("request 1");
  await fetchAll();

  print("request 2");
  await fetchAll();
}

Future<Map<String, String>> authenticate(String email, String password) async {
  // AuthRepository repo = AuthRepository();

  // Response response = await repo.login(email, password);
  // print("Token ${response.data['token']}");
  // print("Refresh ${response.data['refresh']}");

  String token = "x.y.z";
  String refresh = "x.y.z";

  Map<String, String> data = { 'token': token,'refresh': refresh };
  return data;
}

Future<List<dynamic>> fetchAll() async {
  CustomerRepository repo = CustomerRepository();

  Response response = await repo.fetchAll();
  print(response);

  return [];
}

