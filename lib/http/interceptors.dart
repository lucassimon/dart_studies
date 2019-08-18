import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  Dio previous;
  Dio refreshDio = Dio();

  CustomInterceptors(previous) {
    this.previous = previous;
  }

  @override
  onRequest(RequestOptions options) {
    print("Request ${options.method} => path ${options.path} => headers ${options.headers['Authorization']}");

    if (options.headers['Authorization'] == '') {
      // ToDo: logout
      // Response response = await dio.get("/token");
      //Set the token to headers
      // options.headers["Authorization"] = response.data["data"]["token"];
    }

    options.headers["x-request-id"] = 'request-id';
    return options;
  }

  @override
  onResponse(Response response) {
    // 200 && 201 OK
    print("Response ${response.statusCode} => path ${response.request.path}");
    return response;
  }

  @override
  onError(DioError error) {
    // Assume 401 stands for token expired
    if (error.response?.statusCode == 401 && error.response?.data['sub_status'] == 42) {
      RequestOptions options = error.request;
      // If the token has been updated, repeat directly.
      // print("old token ==> ${previous.options.headers["Authorization"]}");
      if (previous.options.headers["Authorization"] != options.headers["Authorization"]) {
        options.headers["Authorization"] = previous.options.headers["Authorization"];
        print("repeat");
        return previous.request(options.path, options: options);
      }
      // update token and repeat
      // Lock to block the incoming request until the token updated
      previous.lock();
      previous.interceptors.responseLock.lock();
      previous.interceptors.errorLock.lock();

      // GET the [refresh token] from shared or LocalStorage or ....
      // TODO: refresh token
      return refreshDio.post(
        "${options.baseUrl}/refresh",
        data: {},
        options: Options(
          headers: {
            'Authorization': "Bearer x.y.z"
          }
        )
      ).then((d) {
        //update token based on the new refresh token
        options.headers["Authorization"] = "Bearer ${d.data['token']}";
        // TODO: Save the new token on shared or LocalStorage
      }).whenComplete(() {
        previous.unlock();
        previous.interceptors.responseLock.unlock();
        previous.interceptors.errorLock.unlock();
      }).then((e) {
        // repeat the request with a new options
        // print("NEW TOKEN 2 ==> ${options.headers["Authorization"]}");
        return previous.request(options.path, options: options);
      }).catchError((error) {
        // TODO: logout
        print(error);
      });
    }
    return error;
  }
}
