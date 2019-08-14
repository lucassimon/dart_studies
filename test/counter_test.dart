import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:studies/oop/counter.dart';


void main() {
  group('Calculate counter', () { 
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();
      counter.increment();

      expect(counter.value, 1);
    });

    test('value should be decremented', () {
      final counter = Counter();
      counter.decrement();

      expect(counter.value, -1);
    });
  });
}