import 'package:cat_breeds_app/config/usecases/use_cases.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/infrastructure/repositories/cat_breeds_repository_impl.dart';

class GetBreedsUseCase extends UseCase<List<CatBreedsEntity>, NoParams> {
  final CatBreedsRepositoryImpl catBreedsRepository;
  GetBreedsUseCase(this.catBreedsRepository);

  @override
  Future call(NoParams params) {
    return catBreedsRepository.getBreeds();
  }
}
