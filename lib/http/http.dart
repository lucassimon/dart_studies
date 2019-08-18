import 'package:dio/dio.dart';
import 'package:studies/http/interceptors.dart';
import 'package:studies/storages/storages.dart';

class CustomHttp extends Dio {

  CustomHttp(String baseUrl, Storage storage) {
    options.baseUrl = baseUrl;

    CustomInterceptors refreshFlow = CustomInterceptors(this, storage);
    interceptors.add(refreshFlow);
  }
}
