import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/presentation/providers/catbreeds_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final breedDetailsProvider =
    StateNotifierProvider<BreedNotifier, Map<String, CatBreedsEntity>>((ref) {
  final getBreed = ref.watch(catBreedsRepositoryProvider).getBreedById;
  return BreedNotifier(getBreed: getBreed);
});

typedef GetBreedCallback = Future<CatBreedsEntity> Function(
    {required String breedId});

class BreedNotifier extends StateNotifier<Map<String, CatBreedsEntity>> {
  final GetBreedCallback getBreed;
  BreedNotifier({required this.getBreed}) : super({});

  Future<void> loadBreed(String breedId) async {
    if (state[breedId] != null) return;

    final breed = await getBreed(breedId: breedId);
    state = {...state, breedId: breed};
  }
}
