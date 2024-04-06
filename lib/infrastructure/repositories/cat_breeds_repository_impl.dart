import 'package:cat_breeds_app/domain/datasources/cat_breeds_datasource.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/domain/repositories/cat_breeds_repository.dart';

class CatBreedsRepositoryImpl implements CatBreedsRepository {
  final CatBreedsDatasource catBreedsDatasource;

  CatBreedsRepositoryImpl(this.catBreedsDatasource);

  @override
  Future<List<CatBreedsEntity>> getBreeds({int page = 1}) async {
    return catBreedsDatasource.getBreeds(page: page);
  }

  @override
  Future<List<CatBreedsEntity>> searchBreeds({String query = ''}) {
    return catBreedsDatasource.searchBreeds(query: query);
  }

  @override
  Future<CatBreedsEntity> getBreedById({required String breedId}) {
    return catBreedsDatasource.getBreedById(breedId: breedId);
  }
}
