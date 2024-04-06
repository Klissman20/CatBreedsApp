import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/presentation/delegates/breeds_search_delegate.dart';
import 'package:cat_breeds_app/presentation/providers/catbreeds_provider.dart';
import 'package:cat_breeds_app/presentation/providers/initial_loading_provider.dart';
import 'package:cat_breeds_app/presentation/providers/search_breeds_provider.dart';
import 'package:cat_breeds_app/presentation/widgets/cat_breeds/cat_breed_card.dart';
import 'package:cat_breeds_app/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(catBreedsProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const Scaffold(body: FullScreenLoader());

    final catBreedsList = ref.watch(catBreedsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Breeds'),
        actions: [
          IconButton(
              onPressed: () {
                final searchedBreeds = ref.read(searchedMoviesProvider);
                final searchQuery = ref.read(searchQueryProvider);
                showSearch<CatBreedsEntity?>(
                        query: searchQuery,
                        context: context,
                        delegate: BreedsSearchDelegate(
                            initialBreeds: searchedBreeds,
                            searchBreeds: ref
                                .read(searchedMoviesProvider.notifier)
                                .searchBreedsByQuery))
                    .then((breed) {
                  if (breed == null) return;
                  context.push('/home/breed/${breed.id}');
                });
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
        itemCount: catBreedsList.length,
        itemBuilder: (context, index) {
          return CatBreedCard(
            catBreed: catBreedsList[index],
          );
        },
      ),
    );
  }
}
