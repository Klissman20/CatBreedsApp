import 'package:bloc/bloc.dart';
import 'package:cat_breeds_app/config/usecases/use_cases.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/domain/usecases/get_breed_by_id_use_case.dart';
import 'package:cat_breeds_app/domain/usecases/get_breeds_use_case.dart';
import 'package:cat_breeds_app/domain/usecases/search_breeds_use_case.dart';
import 'package:meta/meta.dart';

part 'cat_breeds_event.dart';
part 'cat_breeds_state.dart';

class CatBreedsBloc extends Bloc<CatBreedsEvent, CatBreedsState> {
  final GetBreedsUseCase getBreedsUseCase;
  final SearchBreedsUseCase searchBreedsUseCase;
  final GetBreedByIdUseCase getBreedByIdUseCase;

  CatBreedsBloc(
      this.getBreedsUseCase, this.searchBreedsUseCase, this.getBreedByIdUseCase)
      : super(const CatBreedsInitialState()) {
    on<GetCatBreedsEvent>((event, emit) async {
      emit(state.copywith(isLoading: true));
      final List<CatBreedsEntity> cats = await getBreedsUseCase(NoParams());
      emit(state.copywith(catBreedsList: cats, isLoading: false));
      await Future.delayed(const Duration(milliseconds: 200));
    });

    on<SearchCatBreedsEvent>((event, emit) async {
      emit(state.copywith(isLoading: true));
      final List<CatBreedsEntity> cats = await searchBreedsUseCase(event.query);
      emit(state.copywith(searchBreedsList: cats, isLoading: false));
      await Future.delayed(const Duration(milliseconds: 200));
    });

    on<SetSearchQueryEvent>((event, emit) {
      emit(state.copywith(searchQuery: event.query));
    });

    on<GetBreedByIdEvent>((event, emit) async {
      emit(state.copywith(isLoading: true));
      final CatBreedsEntity cat = await getBreedByIdUseCase(event.breedId);
      emit(state.copywith(selectedCatBreed: cat, isLoading: false));
    });
  }
}
