import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';

abstract class CatBreedsRepository {
  Future<List<CatBreedsEntity>> getBreeds({int page = 1});
  Future<List<CatBreedsEntity>> searchBreeds({String query});
}
