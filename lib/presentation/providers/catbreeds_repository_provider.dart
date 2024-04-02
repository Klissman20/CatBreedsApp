import 'package:cat_breeds_app/infrastructure/datasources/cat_breeds_datasource_impl.dart';
import 'package:cat_breeds_app/infrastructure/repositories/cat_breeds_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catBreedsRepositoryProvider = Provider((ref) {
  return CatBreedsRepositoryImpl(CatBreedsDatasourceImpl());
});
