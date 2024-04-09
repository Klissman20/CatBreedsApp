import 'package:bloc_test/bloc_test.dart';
import 'package:cat_breeds_app/config/usecases/use_cases.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/domain/repositories/cat_breeds_repository.dart';
import 'package:cat_breeds_app/domain/services/cat_breed_service.dart';
import 'package:cat_breeds_app/presentation/bloc/cat_breeds/cat_breeds_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/builder/cat_breed_builder.dart';

class MockCatBreedsRepository extends Mock implements CatBreedsRepository {}

void main() {
  group('CatBreedsBloc test', () {
    late CatBreedsRepository catRepositoryMock;
    late CatBreedService catService;
    late List<CatBreedsEntity> catMock;
    setUp(() {
      catRepositoryMock = MockCatBreedsRepository();
      catService = CatBreedService(catRepositoryMock);
      catMock = CatBreedsEntityDataBuilder().buildList(5);
    });
    test('initial state of the bloc is [CatBreedsInitialState()]', () {
      expect(CatBreedsBloc(catService).state, const CatBreedsInitialState());
    });

    blocTest<CatBreedsBloc, CatBreedsState>(
        'emits [CatBreedsState.loading] '
        'state when state.catBreedsList are empty',
        setUp: () {
          when(() => catService.getBreeds(NoParams()))
              .thenAnswer((_) async => <CatBreedsEntity>[]);
        },
        build: () => CatBreedsBloc(catService),
        act: (bloc) => bloc.add(GetCatBreedsEvent()),
        wait: const Duration(milliseconds: 2000),
        expect: () => [
              const CatBreedsState(catBreedsList: [], isLoading: true),
              const CatBreedsState(catBreedsList: [], isLoading: false)
            ]);

    blocTest<CatBreedsBloc, CatBreedsState>(
        'emit [CatBreedsState.catBreedsList] state when state.catBreedsList are not empty',
        setUp: () {
          when(() => catService.getBreeds(NoParams()))
              .thenAnswer((_) async => catMock);
        },
        build: () => CatBreedsBloc(catService),
        act: (bloc) => bloc.add(GetCatBreedsEvent()),
        expect: () => [
              const CatBreedsState(catBreedsList: [], isLoading: true),
              CatBreedsState(catBreedsList: catMock, isLoading: false)
            ]);
  });
}
