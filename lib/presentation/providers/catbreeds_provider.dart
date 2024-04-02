import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/presentation/providers/catbreeds_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catBreedsProvider =
    StateNotifierProvider<CatBreedsNotifier, List<CatBreedsEntity>>((ref) {
  final fetchMoreBreeds = ref.watch(catBreedsRepositoryProvider).getBreeds;
  return CatBreedsNotifier(fetchMoreCatBreeds: fetchMoreBreeds);
});

typedef CatBreedsCallback = Future<List<CatBreedsEntity>> Function({int page});

class CatBreedsNotifier extends StateNotifier<List<CatBreedsEntity>> {
  int currentPage = 0;
  bool isLoading = false;
  final CatBreedsCallback fetchMoreCatBreeds;
  CatBreedsNotifier({required this.fetchMoreCatBreeds}) : super([]);
  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<CatBreedsEntity> catBreeds =
        await fetchMoreCatBreeds(page: currentPage);
    state = [...state, ...catBreeds];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
