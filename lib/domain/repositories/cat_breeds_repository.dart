import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';

abstract class CatBreedsRepository {
  Future<List<CatBreedsEntity>> getBreeds();
}
