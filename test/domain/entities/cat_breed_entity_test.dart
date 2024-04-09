import 'package:cat_breeds_app/infrastructure/shared/exception/not_data_exception.dart';
import 'package:flutter_test/flutter_test.dart';

import '../builder/cat_breed_builder.dart';

void main() {
  group('constructor', () {
    test('validate name Exception', () {
      // //Arrange
      // //Act
      // //Assert
      expect(() => CatBreedsEntityDataBuilder().withName('').build(),
          throwsA(isA<NotDataFoundException>()));
    });
  });
}
