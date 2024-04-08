import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/infrastructure/datasources/cat_breeds_datasource_impl.dart';
import 'package:cat_breeds_app/infrastructure/repositories/cat_breeds_repository_impl.dart';
import 'package:cat_breeds_app/infrastructure/shared/http_client/exceptions/http_client_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCatBreedsDatasource extends Mock implements CatBreedsDatasourceImpl {}

void main() {
  group('getBreeds', () {
    late CatBreedsRepositoryImpl catBreedsRepository;
    late MockCatBreedsDatasource catBreedsDatasource;

    setUp(() {
      catBreedsDatasource = MockCatBreedsDatasource();
      catBreedsRepository = CatBreedsRepositoryImpl(catBreedsDatasource);
    });

    test('should return a list of CatBreedsEntity', () async {
      //Arrange
      when(() => catBreedsDatasource.getBreeds())
          .thenAnswer((_) => Future.value([
                const CatBreedsEntity(
                    id: 'id',
                    origin: 'origin',
                    temperament: 'temperament',
                    intelligence: 0,
                    adaptability: 0,
                    lifeSpan: 'lifeSpan',
                    name: 'name',
                    description: 'description',
                    affectionLevel: 0,
                    childFriendly: 0,
                    dogFriendly: 0,
                    energyLevel: 0,
                    grooming: 0,
                    healthIssues: 0,
                    sheddingLevel: 0,
                    socialNeeds: 0,
                    strangerFriendly: 0,
                    vocalisation: 0,
                    experimental: 0,
                    hairless: 0,
                    natural: 0)
              ]));
      //Act
      final result = await catBreedsRepository.getBreeds();
      //Assert
      expect(result, isA<List<CatBreedsEntity>>());
    });

    test('should return an empty list', () async {
      when(() => catBreedsDatasource.getBreeds())
          .thenAnswer((_) => Future.value([]));
      final result = await catBreedsRepository.getBreeds();
      expect(result, isEmpty);
    });

    test('should throw an exception', () async {
      when(() => catBreedsDatasource.getBreeds())
          .thenThrow(HttpClientException());
      expect(catBreedsRepository.getBreeds, throwsException);
    });
  });
}
