import 'dart:async';
import 'package:dio/dio.dart';
import 'package:studies/repositories/customer_repository.dart';
import 'package:studies/repositories/auth_repository.dart';
import 'package:studies/storages/redis_storage.dart';
import 'package:studies/storages/storages.dart';

// Authenticate in API Rest Client that response a jwt token. This will use
// interceptors to refresh tokens

void main() async {

  Map<String, String> signIn = await authenticate('lucassrod@gmail.com', 'teste123');

  // save to RedisStorage or LocalStorage or Shared Or ...
  RedisStorage redisStorage = RedisStorage();
  Storage storage = Storage(redisStorage);
  await storage.save('my-application-token', signIn['token']);
  await storage.save('my-application-refresh', signIn['refresh']);

  print("\nrequest 1");
  await fetchAll();

  Timer(Duration(minutes: 3), () async {
    print("\nrequest 2");
    await fetchAll();
  });

  Timer(Duration(minutes: 4), () async {
    print("\nrequest 3");
    await fetchAll();
  });

  Timer(Duration(minutes: 5), () async {
    print("\nrequest 4");
    await storage.clear();
    await fetchAll();
  });

}

Future<Map<String, String>> authenticate(String email, String password) async {
  AuthRepository repo = AuthRepository();

  Response response = await repo.login(email, password);

  String token = "${response.data['token']}";
  String refresh = "${response.data['refresh']}";

  Map<String, String> data = { 'token': token,'refresh': refresh };
  return data;
}

Future<Response> fetchAll() async {
  RedisStorage redisStorage = RedisStorage();
  CustomerRepository repo = CustomerRepository(redisStorage);

  Response response = await repo.fetchAll();
  print(response.data);
  return response;
}
