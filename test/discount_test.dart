import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:studies/oop/discount.dart';


void main() {
  group('Calculate discount', () { 

    test('should calculate discount correctly when amount and value in cents', () {
      final price = Discount(300);
      expect(price.calculate(100), 200);
    });

    test('should calculate discount correctly when value is 5%', () {
      final price = Discount(300);
      expect(price.calculate(5, isPercent: true), 285);
    });

    test('should raise an exception when amount is 0', () {
      expect(() => Discount(0), throwsA(TypeMatcher<ArgumentError>()));
    });

    test('should raise an exception when value in discount is 0', () {
      expect(() => Discount(300).calculate(0), throwsA(TypeMatcher<ArgumentError>()));
    });
  });
}