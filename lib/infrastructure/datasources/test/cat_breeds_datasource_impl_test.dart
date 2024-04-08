import 'package:cat_breeds_app/domain/datasources/cat_breeds_datasource.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';

class CatBreedsDatasourceImplTest implements CatBreedsDatasource {
  @override
  Future<List<CatBreedsEntity>> getBreeds({int page = 1}) async {
    return catBreeds;
  }

  @override
  Future<List<CatBreedsEntity>> searchBreeds(String query) async {
    return catBreeds
        .where((element) =>
            element.name.contains(query) ||
            element.temperament.contains(query) ||
            element.origin.contains(query))
        .toList();
  }

  @override
  Future<CatBreedsEntity> getBreedById({required String breedId}) async {
    return catBreeds.firstWhere((element) => element.id == breedId);
  }

  List<CatBreedsEntity> catBreeds = const [
    CatBreedsEntity(
      id: '1',
      name: 'Breed1',
      description: 'Description1',
      temperament: 'Temperament1',
      origin: 'Origin1',
      intelligence: 0,
      lifeSpan: 'test1',
      adaptability: 0,
      affectionLevel: 0,
      childFriendly: 0,
      grooming: 0,
      healthIssues: 0,
      socialNeeds: 0,
      strangerFriendly: 0,
      vocalisation: 0,
      dogFriendly: 0,
      experimental: 0,
      hairless: 0,
      referenceImageId: 'test1',
      energyLevel: 0,
      sheddingLevel: 0,
      natural: 0,
    ),
    CatBreedsEntity(
      id: '2',
      name: 'Breed2',
      description: 'Description2',
      temperament: 'Temperament2',
      origin: 'Origin2',
      intelligence: 0,
      lifeSpan: 'test2',
      adaptability: 0,
      affectionLevel: 0,
      childFriendly: 0,
      grooming: 0,
      healthIssues: 0,
      socialNeeds: 0,
      strangerFriendly: 0,
      vocalisation: 0,
      dogFriendly: 0,
      experimental: 0,
      hairless: 0,
      referenceImageId: 'test2',
      energyLevel: 0,
      sheddingLevel: 0,
      natural: 0,
    ),
    CatBreedsEntity(
      id: '3',
      name: 'Breed3',
      description: 'Description3',
      temperament: 'Temperament3',
      origin: 'Origin3',
      intelligence: 0,
      lifeSpan: 'test3',
      adaptability: 0,
      affectionLevel: 0,
      childFriendly: 0,
      grooming: 0,
      healthIssues: 0,
      socialNeeds: 0,
      strangerFriendly: 0,
      vocalisation: 0,
      dogFriendly: 0,
      experimental: 0,
      hairless: 0,
      referenceImageId: 'test3',
      energyLevel: 0,
      sheddingLevel: 0,
      natural: 0,
    ),
  ];
}
