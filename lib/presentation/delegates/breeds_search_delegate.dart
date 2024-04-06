import 'dart:async';

import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:flutter/material.dart';

typedef SearchBreedsCallback = Future<List<CatBreedsEntity>> Function(
    {String query});

class BreedsSearchDelegate extends SearchDelegate<CatBreedsEntity?> {
  final SearchBreedsCallback searchBreeds;
  StreamController<List<CatBreedsEntity>> debouncedBreeds =
      StreamController.broadcast();
  Timer? _debounceTimer;

  BreedsSearchDelegate({required this.searchBreeds});

  void _onQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 700), () async {
      if (query.isEmpty) {
        debouncedBreeds.add([]);
        return;
      }
      final breeds = await searchBreeds(query: query);
      debouncedBreeds.add(breeds);
    });
  }

  void _clearStream() {
    debouncedBreeds.close();
  }

  @override
  String get searchFieldLabel => 'Type a breed';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          _clearStream();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back)); // Icon(Icons.search)
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return StreamBuilder(
        stream: debouncedBreeds.stream,
        builder: (context, snapshot) {
          final breeds = snapshot.data ?? [];
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
