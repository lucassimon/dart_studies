import 'dart:convert';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:studies/storages/redis_storage.dart';


void main() {
  group('Redis Storage', () {
    RedisStorage storage;

    setUp(() { storage = RedisStorage(); });

    tearDownAll(() { storage.clear(); });

    group('Set simple keys', () {
      test('should set some value in some-key', () async {
        var item = await storage.save('some-key', 'some-value');
        expect(item,  equals("OK"));
      });

      test('should return/get some value in some-key', () async {
        var item = await storage.fetch('some-key');
        expect(item,  equals("some-value"));
      });

      test('should delete the some-key key', () async {
        var item = await storage.delete('some-key');
        expect(item,  equals(1));
      });
    });

    group('HSet keys', () {
      test('should set auth map in some-map key and auth index', () async {
        Map<String, String> auth = {
          "token": "some-token",
          "refresh": "some-refresh"
        };
        String parsed = json.encode(auth);
        var item = await storage.sendMap('some-map', parsed, 'auth');
        expect(item,  equals(1));
      });

      test('should return/get some-map and auth index', () async {
        var item = await storage.fetchMap('some-map', 'auth');
        expect(item["token"],  equals("some-token"));
        expect(item["refresh"],  equals("some-refresh"));
      });

      test('should delete the some-map key', () async {
        var item = await storage.delete('some-map');
        expect(item,  equals(1));
      });
    });
  });
}
