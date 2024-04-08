import 'package:bloc/bloc.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/infrastructure/datasources/cat_breeds_datasource_impl.dart';
import 'package:cat_breeds_app/infrastructure/repositories/cat_breeds_repository_impl.dart';
import 'package:cat_breeds_app/infrastructure/shared/http_client/http_client.dart';
import 'package:meta/meta.dart';

part 'cat_breeds_event.dart';
part 'cat_breeds_state.dart';

class CatBreedsBloc extends Bloc<CatBreedsEvent, CatBreedsState> {
  CatBreedsBloc() : super(const CatBreedsInitialState()) {
    final HttpClient httpClient = HttpClient();

    on<GetCatBreedsEvent>((event, emit) async {
      emit(state.copywith(isLoading: true));
      final List<CatBreedsEntity> cats =
          await CatBreedsRepositoryImpl(CatBreedsDatasourceImpl(httpClient))
              .getBreeds();
      emit(state.copywith(catBreedsList: cats, isLoading: false));
      await Future.delayed(const Duration(milliseconds: 200));
    });

    on<SearchCatBreedsEvent>((event, emit) async {
      emit(state.copywith(isLoading: true));
      final List<CatBreedsEntity> cats =
          await CatBreedsRepositoryImpl(CatBreedsDatasourceImpl(httpClient))
              .searchBreeds(event.query);
      emit(state.copywith(searchBreedsList: cats, isLoading: false));
      await Future.delayed(const Duration(milliseconds: 200));
    });

    on<SetSearchQueryEvent>((event, emit) {
      emit(state.copywith(searchQuery: event.query));
    });

    on<GetBreedByIdEvent>((event, emit) async {
      emit(state.copywith(isLoading: true));
      final CatBreedsEntity cat =
          await CatBreedsRepositoryImpl(CatBreedsDatasourceImpl(httpClient))
              .getBreedById(breedId: event.breedId);
      emit(state.copywith(selectedCatBreed: cat, isLoading: false));
    });
  }
}
