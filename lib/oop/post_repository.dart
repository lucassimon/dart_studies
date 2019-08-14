import 'dart:convert';
import 'package:http/http.dart';
import 'package:studies/oop/post_model.dart';


class PostRepository {
  Client client = Client();
  final url = 'https://jsonplaceholder.typicode.com/posts/';

  Future<List<Post>> posts() async {
    List<Post> posts = List<Post>();
    final response = await client.get(url);
    if (response.statusCode == 200) { 
      List<dynamic> items = json.decode(response.body);
      for (dynamic item in items) {
        Post post = Post.fromJson(item);
        posts.add(post);
      }
      return posts;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Post> post(int id) async {
    final response = await client.get(url + '${id}');
    
    if (response.statusCode == 200) { 
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}