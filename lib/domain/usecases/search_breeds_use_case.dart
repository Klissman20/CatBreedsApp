import 'package:cat_breeds_app/config/usecases/use_cases.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/infrastructure/repositories/cat_breeds_repository_impl.dart';

class SearchBreedsUseCase extends UseCase<List<CatBreedsEntity>, String> {
  final CatBreedsRepositoryImpl catBreedsRepository;
  SearchBreedsUseCase(this.catBreedsRepository);

  @override
  Future call(String params) {
    return catBreedsRepository.searchBreeds(params);
  }
}
