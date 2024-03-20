import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';

abstract class CatBreedsDatasource {
  Future<List<CatBreedsEntity>> getBreeds();
}
