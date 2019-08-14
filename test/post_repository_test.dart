import 'dart:convert';
import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:studies/oop/post_model.dart';
import 'package:studies/oop/post_repository.dart';

class MockClient extends Mock implements Client {}


void main() {
  group('Post Repository', () {
    // test('returns a Post if the http call completes successfully', () async {
    //   final apiProvider = PostRepository();

    //   // Use Mockito to return a successful response when it calls the
    //   // provided http.Client.
    //   when(apiProvider.client.get('https://jsonplaceholder.typicode.com/posts/1'))
    //     .thenAnswer((_) async => Response('{"title": "Test"}', 200));
    //   final item = await apiProvider.post(1);
    //   expect(item.title, "test");
    // });

    // test('throws an exception if the http call completes with an error', () {
    //   final client = MockClient();

    //   // Use Mockito to return an unsuccessful response when it calls the
    //   // provided http.Client.
    //   when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
    //       .thenAnswer((_) async => Response('Not Found', 404));
    //   expect(PostRepository().posts(), throwsException);
    // });
  });
}
