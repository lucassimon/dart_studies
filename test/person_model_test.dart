import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:studies/oop/person_model.dart';

class MockPerson extends Mock implements Person {}

void main() {
  group('Get Category By age', () {
    test('should return Old when age is gte 50', () {
      Person person = Person(name: 'Some Person', age: 52, weight: 77.7, height: 1.77);
      expect(person.categoryByAge(), 'Old');
    });

    test('should return Adult when age is gt 25', () {
      Person person = Person(name: 'Some Person', age: 26, weight: 77.7, height: 1.77);
      expect(person.categoryByAge(), 'Adult');
    });

    test('should return Younger when age is gt 22', () {
      Person person = Person(name: 'Some Person', age: 22, weight: 77.7, height: 1.77);
      expect(person.categoryByAge(), 'Younger');
    });

    test('should return Child when age is lt 12', () {
      Person person = Person(name: 'Some Person', age: 11, weight: 77.7, height: 1.77);
      expect(person.categoryByAge(), 'Child');
    });
  });

  group('Calculate bmi', () {
    test('should return the bmi equals 24.577867151840145', () {
      Person person = Person(name: 'Some Person', age: 11, weight: 77, height: 1.77);
      expect(person.bmi(), 24.58);
    });
  });

  group('Display obsesity', () {
    test('should return the normal by according bmi', () {
      Person person = Person(name: 'Some Person', age: 11, weight: 77, height: 1.77);
      expect(person.obesity(), 'Normal');
    });

    test('should return the "Under weight" by according bmi', () {
      Person person = Person(name: 'Some Person', age: 11, weight: 57, height: 1.77);
      expect(person.obesity(), 'Under weight');
    });

    test('should return the "Overweight" by according bmi', () {
      Person person = Person(name: 'Some Person', age: 11, weight: 79, height: 1.77);
      expect(person.obesity(), 'Overweight');
    });

    test('should return the "Grade 1" by according bmi', () {
      Person person = Person(name: 'Some Person', age: 11, weight: 97, height: 1.77);
      expect(person.obesity(), 'Grade 1');
    });

    test('should return the "Grade 2" by according bmi', () {
      Person person = Person(name: 'Some Person', age: 11, weight: 115, height: 1.77);
      expect(person.obesity(), 'Grade 2');
    });
  });


  group('Display obsesity with mock', () { 
  
    test('should return the bmi equals 88.8 when mockit', () {
      MockPerson personMocked = MockPerson();
      when(personMocked.bmi()).thenReturn(88.8);
      expect(personMocked.bmi(), 88.8);
    });


    test('should return the "Grade 3" by according bmi', () {
      MockPerson personMocked = MockPerson();
      when(personMocked.bmi()).thenReturn(88.8);
      expect(personMocked.obesity(), 'Grade 3');
    });
  });
}