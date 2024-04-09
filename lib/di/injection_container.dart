import 'package:cat_breeds_app/domain/datasources/cat_breeds_datasource.dart';
import 'package:cat_breeds_app/domain/repositories/cat_breeds_repository.dart';
import 'package:cat_breeds_app/domain/services/cat_breed_service.dart';
import 'package:cat_breeds_app/infrastructure/datasources/cat_breeds_datasource_impl.dart';
import 'package:cat_breeds_app/infrastructure/repositories/cat_breeds_repository_impl.dart';
import 'package:cat_breeds_app/infrastructure/shared/http_client/http_client.dart';
import 'package:cat_breeds_app/presentation/bloc/cat_breeds/cat_breeds_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Features
  // Bloc
  getIt.registerFactory(
    () => CatBreedsBloc(getIt()),
  );

  // Service
  getIt.registerLazySingleton(() => CatBreedService(getIt()));

  getIt.registerLazySingleton<CatBreedsRepository>(
    () => CatBreedsRepositoryImpl(getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<CatBreedsDatasource>(
    () => CatBreedsDatasourceImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<CatBreedsRepositoryImpl>(
    () => CatBreedsRepositoryImpl(getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<CatBreedsDatasourceImpl>(
    () => CatBreedsDatasourceImpl(getIt()),
  );

  //! External
  getIt.registerLazySingleton<HttpClient>(() => HttpClient());
  //getIt.registerLazySingleton(() => InternetConnectionChecker());

  // //! Routes
  // getIt.registerSingleton<AppRouter>(AppRouter());
}
