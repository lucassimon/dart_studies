import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:studies/oop/post_model.dart';
import 'package:studies/oop/post_repository.dart';

class MockClient extends Mock implements Dio {}


void main() {
  group('Post Repository', () {
    // test('returns a Post if the http call completes successfully', () async {
    //   PostRepository apiProvider = PostRepository();
    //   apiProvider.dio = MockClient();

    //   when(apiProvider.dio.get('https://jsonplaceholder.typicode.com/posts/1'))
    //     .thenAnswer((_) async => Response(
    //         data: {"id": 1, "title": "test", "userId": 1, "body": "test"},
    //         statusCode: 200
    //       )
    //     );
    //   Post item = await apiProvider.post(1);
    //   expect(item.title, "test");
    // });

    test('throws an exception if the http call completes with an error', () async {
      PostRepository apiProvider = PostRepository();
      apiProvider.dio = MockClient();

      when(apiProvider.dio.get('https://jsonplaceholder.typicode.com/posts/1'))
        .thenAnswer((_) async => Response(data: 'Not Found', statusCode: 404));

      expect(PostRepository().post(1), throwsException);
    });
  });
}
