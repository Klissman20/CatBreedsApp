import 'package:cat_breeds_app/presentation/providers/catbreeds_provider.dart';
import 'package:cat_breeds_app/presentation/providers/initial_loading_provider.dart';
import 'package:cat_breeds_app/presentation/widgets/cat_breeds/cat_breed_card.dart';
import 'package:cat_breeds_app/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
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
