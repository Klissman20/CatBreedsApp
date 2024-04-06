import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/presentation/providers/catbreeds_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, List<CatBreedsEntity>>((ref) {
  return SearchMoviesNotifier(
      searchBreeds: ref.read(catBreedsRepositoryProvider).searchBreeds,
      ref: ref);
});

typedef SearchBreedsCallback = Future<List<CatBreedsEntity>> Function(
    String query);

class SearchMoviesNotifier extends StateNotifier<List<CatBreedsEntity>> {
  final SearchBreedsCallback searchBreeds;
  final Ref ref;
  SearchMoviesNotifier({required this.searchBreeds, required this.ref})
      : super([]);

  Future<List<CatBreedsEntity>> searchBreedsByQuery(String query) async {
    final List<CatBreedsEntity> breeds = await searchBreeds(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = breeds;
    return breeds;
  }
}
