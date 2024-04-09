part of 'cat_breeds_bloc.dart';

@immutable
class CatBreedsState extends Equatable {
  final List<CatBreedsEntity> catBreedsList;
  final bool isLoading;
  final String searchQuery;
  final List<CatBreedsEntity> searchBreedsList;
  final CatBreedsEntity? selectedCatBreed;
  const CatBreedsState(
      {this.catBreedsList = const [],
      this.isLoading = true,
      this.searchBreedsList = const [],
      this.selectedCatBreed,
      this.searchQuery = ''});

  CatBreedsState copywith(
          {List<CatBreedsEntity>? catBreedsList,
          List<CatBreedsEntity>? searchBreedsList,
          String? searchQuery,
          bool? isLoading,
          CatBreedsEntity? selectedCatBreed}) =>
      CatBreedsState(
          catBreedsList: catBreedsList ?? this.catBreedsList,
          searchBreedsList: searchBreedsList ?? this.searchBreedsList,
          searchQuery: searchQuery ?? this.searchQuery,
          isLoading: isLoading ?? this.isLoading,
          selectedCatBreed: selectedCatBreed ?? this.selectedCatBreed);

  @override
  List<Object?> get props => [
        catBreedsList,
        isLoading,
        selectedCatBreed,
        searchQuery,
        searchBreedsList
      ];
}

final class CatBreedsInitialState extends CatBreedsState {
  const CatBreedsInitialState()
      : super(
            catBreedsList: const [],
            isLoading: true,
            searchBreedsList: const [],
            selectedCatBreed: null,
            searchQuery: '');
}
