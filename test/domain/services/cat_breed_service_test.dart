import 'package:cat_breeds_app/config/usecases/use_cases.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/domain/repositories/cat_breeds_repository.dart';
import 'package:cat_breeds_app/domain/services/cat_breed_service.dart';
import 'package:cat_breeds_app/infrastructure/shared/exception/not_data_exception.dart';
import 'package:flutter_test/flutter_test.dart';

import '../builder/cat_breed_builder.dart';
import 'package:mocktail/mocktail.dart';

class MockCatBreedsRepository extends Mock implements CatBreedsRepository {}

void main() {
  group('get breeds service test', () {
    late List<CatBreedsEntity> catBreeds;
    late CatBreedsRepository catBreedsRepository;
    setUp(() {
      catBreeds = CatBreedsEntityDataBuilder().buildList(10);
      catBreedsRepository = MockCatBreedsRepository();
    });

    test('> get cat breeds list from api', () async {
      //Arrange
      when(() => catBreedsRepository.getBreeds())
          .thenAnswer((_) async => catBreeds);
      //Act
      final result =
          await CatBreedService(catBreedsRepository).getBreeds(NoParams());
      //Assert
      verify(() => catBreedsRepository.getBreeds()).called(1);

      expect(result, isNotNull);
      expect(catBreeds, result);
      expect(catBreeds.length, result.length);
    });

    test('> get breed list from api > throw Not Found Exception', () async {
      //Arrange
      when(() => catBreedsRepository.getBreeds())
          .thenThrow(NotDataFoundException());
      //Act
      //Assert
      expect(() => CatBreedService(catBreedsRepository).getBreeds(NoParams()),
          throwsA(isA<NotDataFoundException>()));
    });

    test('get breed by id from api success', () async {
      //Arrange
      when(() => catBreedsRepository.getBreedById(breedId: catBreeds[0].id))
          .thenAnswer((_) async => catBreeds[0]);
      //Act
      final result = await CatBreedService(catBreedsRepository)
          .getBreedById(catBreeds[0].id);
      //Assert
      verify(() => catBreedsRepository.getBreedById(breedId: catBreeds[0].id))
          .called(1);
      expect(result, isNotNull);
      expect(result, catBreeds[0]);
    });

    test('get breed by id from api > throw Not Data Found Exception', () async {
      //Arrange
      when(() => catBreedsRepository.getBreedById(breedId: catBreeds[0].id))
          .thenThrow(NotDataFoundException());
      //Act
      //Assert
      expect(
          () => CatBreedService(catBreedsRepository)
              .getBreedById(catBreeds[0].id),
          throwsA(isA<NotDataFoundException>()));
    });

    test('search breed from api', () async {
      //Arrange
      when(() => catBreedsRepository.searchBreeds(''))
          .thenAnswer((_) async => catBreeds);
      //Act
      final result =
          await CatBreedService(catBreedsRepository).searchBreeds('');
      //Assert
      verify(() => catBreedsRepository.searchBreeds('')).called(1);
      expect(result, isNotNull);
      expect(catBreeds, result);
      expect(catBreeds.length, result.length);
    });

    test('search breed from api > throw Not Data Found Exception', () async {
      //Arrange
      when(() => catBreedsRepository.searchBreeds(''))
          .thenThrow(NotDataFoundException());
      //Act
      //Assert
      expect(() => CatBreedService(catBreedsRepository).searchBreeds(''),
          throwsA(isA<NotDataFoundException>()));
    });
  });
}
