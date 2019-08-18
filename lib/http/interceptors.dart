import 'package:dio/dio.dart';
import 'package:studies/storages/storages.dart';

class CustomInterceptors extends InterceptorsWrapper {
  Storage _storage;
  Dio previous;
  Dio refreshDio = Dio();

  CustomInterceptors(previous, Storage storage) {
    this.previous = previous;
    this._storage = storage;
  }

  @override
  onRequest(RequestOptions options) async {
    // get [token] from shared or localStorage or Redis Or Sqflite
    String accessToken = await getToken();

    if (accessToken == null) {
      // ToDo: logout
      await logout();
    }

    options.headers["Authorization"] = "Bearer $accessToken";
    options.headers["x-request-id"] = 'request-id';
    return options;
  }

  saveToken(String token) async =>  await _storage.save('my-application-token', token);
  getToken() async =>  await _storage.fetch('my-application-token');

  saveRefresh(String token) async =>  await _storage.save('my-application-refresh', token);
  getRefreshToken() async =>  await _storage.fetch('my-application-refresh');

  clearTokens() async => await _storage.clear();

  logout() async {
    await clearTokens();
    throw DioError(error: 'Token not found. Please do Login.');
  }

  // 200 && 201 OK
  @override
  onResponse(Response response) => response;

  @override
  onError(DioError error) async {
    // Assume 401 stands for token expired
    if (error.response?.statusCode == 401 && error.response?.data['sub_status'] == 42) {
      RequestOptions options = error.request;

      // If the token has been updated, repeat directly.
      String accessToken = await getToken();

      String token = "Bearer $accessToken";
      if (token != options.headers["Authorization"]) {
        options.headers["Authorization"] = token;
        return previous.request(options.path, options: options);
      }

      // Lock to block the incoming request until the token updated
      previous.lock();
      previous.interceptors.responseLock.lock();
      previous.interceptors.errorLock.lock();

      try {
        // GET the [refresh token] from shared or LocalStorage or ....
        String refreshToken = await getRefreshToken();

        Response responseRefresh = await refreshDio.post(
          "${options.baseUrl}/refresh",
          data: {},
          options: Options(
            headers: {
              'Authorization': "Bearer $refreshToken"
            }
          )
        );

        //update token based on the new refresh token
        options.headers["Authorization"] = "Bearer ${responseRefresh.data['token']}";

        // Save the new token on shared or LocalStorage
        await saveToken(responseRefresh.data['token']);

        previous.unlock();
        previous.interceptors.responseLock.unlock();
        previous.interceptors.errorLock.unlock();

        // repeat the request with a new options
        return previous.request(options.path, options: options);

      } catch (e) {
        logout();
      }
    }
    return error;
  }
}
