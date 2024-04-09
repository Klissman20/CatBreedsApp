part of 'cat_breeds_bloc.dart';

@immutable
abstract class CatBreedsEvent {}

class GetCatBreedsEvent extends CatBreedsEvent {
  GetCatBreedsEvent();
}

class SearchCatBreedsEvent extends CatBreedsEvent {
  final String query;
  SearchCatBreedsEvent(this.query);
}

class GetBreedByIdEvent extends CatBreedsEvent {
  final String breedId;
  GetBreedByIdEvent(this.breedId);
}

class SetSearchQueryEvent extends CatBreedsEvent {
  final String query;
  SetSearchQueryEvent(this.query);
}
