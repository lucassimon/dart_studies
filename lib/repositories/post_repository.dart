import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:studies/oop/post_model.dart';


class PostRepository {
  Dio dio = Dio();
  String url = "https://jsonplaceholder.typecode.com";

  Future<List<Post>> posts() async {
    String endpoint = '$url/posts';
    List<Post> posts = List<Post>();

    final Response response = await dio.get(endpoint);

    if (response.statusCode == 200) {
      posts = (response.data as List).map((item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Post> post(int id) async {
    String endpoint = '$url/posts/$id';
    final Response response = await dio.get(endpoint);

    if (response.statusCode == 200) {
      return Post.fromJson(response.data);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
