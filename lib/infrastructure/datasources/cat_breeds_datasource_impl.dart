import 'package:cat_breeds_app/domain/datasources/cat_breeds_datasource.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';

class CatBreedsDatasourceImpl implements CatBreedsDatasource {
  @override
  Future<List<CatBreedsEntity>> getBreeds() async {
    return [];
  }
}
