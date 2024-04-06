import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';

abstract class CatBreedsDatasource {
  Future<List<CatBreedsEntity>> getBreeds({int page = 1});
  Future<List<CatBreedsEntity>> searchBreeds(String query);
  Future<CatBreedsEntity> getBreedById({required String breedId});
}
