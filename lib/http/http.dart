import 'package:dio/dio.dart';
import 'package:studies/http/interceptors.dart';

class CustomHttp extends Dio {

  CustomHttp(String baseUrl) {
    options.baseUrl = baseUrl;

    CustomInterceptors refreshFlow = CustomInterceptors(this);
    interceptors.add(refreshFlow);
    // get [token] from shared or localStorage
    // TODO: get token
    options.headers["Authorization"] = "Bearer x.y.z";
  }
}
