import 'package:cat_breeds_app/infrastructure/datasources/cat_breeds_datasource_impl.dart';
import 'package:cat_breeds_app/infrastructure/repositories/cat_breeds_repository_impl.dart';
import 'package:cat_breeds_app/infrastructure/shared/http_client/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catBreedsRepositoryProvider = Provider((ref) {
  return CatBreedsRepositoryImpl(
      CatBreedsDatasourceImpl(ref.watch(httpClientProvider)));
});

final httpClientProvider = Provider((ref) => HttpClient());
