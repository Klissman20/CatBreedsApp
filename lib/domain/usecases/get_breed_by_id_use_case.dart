import 'package:cat_breeds_app/config/usecases/use_cases.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/infrastructure/repositories/cat_breeds_repository_impl.dart';

class GetBreedByIdUseCase extends UseCase<CatBreedsEntity, String> {
  final CatBreedsRepositoryImpl catBreedsRepository;
  GetBreedByIdUseCase(this.catBreedsRepository);

  @override
  Future call(String params) {
    return catBreedsRepository.getBreedById(breedId: params);
  }
}
