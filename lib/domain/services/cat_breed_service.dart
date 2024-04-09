import 'package:cat_breeds_app/config/usecases/use_cases.dart';
import 'package:cat_breeds_app/domain/repositories/cat_breeds_repository.dart';

class CatBreedService {
  final CatBreedsRepository catBreedsRepository;

  CatBreedService(this.catBreedsRepository);

  Future getBreeds(NoParams params) {
    return catBreedsRepository.getBreeds();
  }

  Future getBreedById(String params) {
    return catBreedsRepository.getBreedById(breedId: params);
  }

  Future searchBreeds(String params) {
    return catBreedsRepository.searchBreeds(params);
  }
}
