import 'package:bloc/bloc.dart';
import 'package:cat_breeds_app/config/usecases/use_cases.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/domain/services/cat_breed_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cat_breeds_event.dart';
part 'cat_breeds_state.dart';

class CatBreedsBloc extends Bloc<CatBreedsEvent, CatBreedsState> {
  final CatBreedService catBreedService;

  CatBreedsBloc(this.catBreedService) : super(const CatBreedsInitialState()) {
    on<GetCatBreedsEvent>((event, emit) async {
      emit(state.copywith(isLoading: true));
      final List<CatBreedsEntity> cats =
          await catBreedService.getBreeds(NoParams());
      emit(state.copywith(catBreedsList: cats, isLoading: false));
      await Future.delayed(const Duration(milliseconds: 100));
    });

    on<SearchCatBreedsEvent>((event, emit) async {
      emit(state.copywith(isLoading: true));
      final List<CatBreedsEntity> cats =
          await catBreedService.searchBreeds(event.query);
      emit(state.copywith(searchBreedsList: cats, isLoading: false));
      await Future.delayed(const Duration(milliseconds: 100));
    });

    on<SetSearchQueryEvent>((event, emit) {
      emit(state.copywith(searchQuery: event.query));
    });

    on<GetBreedByIdEvent>((event, emit) async {
      emit(state.copywith(isLoading: true));
      final CatBreedsEntity cat =
          await catBreedService.getBreedById(event.breedId);
      emit(state.copywith(selectedCatBreed: cat, isLoading: false));
    });
  }
}
