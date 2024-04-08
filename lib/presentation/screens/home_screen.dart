import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/presentation/bloc/cat_breeds/cat_breeds_bloc.dart';
import 'package:cat_breeds_app/presentation/delegates/breeds_search_delegate.dart';
import 'package:cat_breeds_app/presentation/widgets/cat_breeds/cat_breed_card.dart';
import 'package:cat_breeds_app/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<CatBreedsBloc>().add(GetCatBreedsEvent());
    //ref.read(catBreedsProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBreedsBloc, CatBreedsState>(builder: (_, state) {
      if (state.isLoading) return const Scaffold(body: FullScreenLoader());

      return Scaffold(
        appBar: AppBar(
          title: const Text('Cat Breeds'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch<CatBreedsEntity?>(
                      query: state.searchQuery,
                      context: context,
                      delegate: BreedsSearchDelegate(
                        initialBreeds: state.searchBreedsList,
                      )).then((breed) {
                    if (breed == null) return;
                    context.push('/home/breed/${breed.id}');
                  });
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: ListView.builder(
          itemCount: state.catBreedsList.length,
          itemBuilder: (context, index) {
            return CatBreedCard(
              catBreed: state.catBreedsList[index],
            );
          },
        ),
      );
    });
  }
}
