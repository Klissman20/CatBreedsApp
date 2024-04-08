import 'dart:async';

import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/presentation/bloc/cat_breeds/cat_breeds_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SearchBreedsCallback = void Function(String query);

class BreedsSearchDelegate extends SearchDelegate<CatBreedsEntity?> {
  List<CatBreedsEntity> initialBreeds;
  Timer? _debounceTimer;

  BreedsSearchDelegate({required this.initialBreeds});

  void _onQueryChanged(BuildContext context, String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 700), () {
      context.read<CatBreedsBloc>().add(SearchCatBreedsEvent(query));
      final breeds = context.read<CatBreedsBloc>().state.searchBreedsList;
      initialBreeds = breeds;
    });
  }

  @override
  String get searchFieldLabel => 'Type a breed';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            context.read<CatBreedsBloc>().add(SetSearchQueryEvent(query));
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back)); // Icon(Icons.search)
  }

  Widget _buildResultsAndSuggestions() {
    return BlocBuilder<CatBreedsBloc, CatBreedsState>(builder: (_, state) {
      final breeds = state.searchBreedsList;
      return ListView.builder(
          itemBuilder: (context, index) {
            return _BreedItem(
              breed: breeds[index],
              onMovieSelected: close,
            );
          },
          itemCount: breeds.length);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(context, query);
    context.read<CatBreedsBloc>().add(SetSearchQueryEvent(query));
    return _buildResultsAndSuggestions();
  }
}

class _BreedItem extends StatelessWidget {
  final CatBreedsEntity breed;
  final Function onMovieSelected;
  const _BreedItem({required this.breed, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, breed);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    'https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg',
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : const Center(
                                child: CircularProgressIndicator(
                                strokeWidth: 1.0,
                              )),
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/image_not_available.png'),
                  )),
            ),
            const SizedBox(width: 10.0),
            SizedBox(
                width: size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(breed.name, style: textStyle.titleLarge),
                    breed.description.length > 100
                        ? Text('${breed.description.substring(0, 100)}...',
                            style: textStyle.bodySmall)
                        : Text(breed.description, style: textStyle.bodySmall),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text('Origin: ', style: textStyle.labelLarge),
                        Text(breed.origin, style: textStyle.labelLarge),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
