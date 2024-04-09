import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/presentation/bloc/cat_breeds/cat_breeds_bloc.dart';
import 'package:cat_breeds_app/presentation/screens/home_screen.dart';
import 'package:cat_breeds_app/presentation/widgets/cat_breeds/cat_breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/builder/cat_breed_builder.dart';

class MockCatBreedsBloc extends Mock implements CatBreedsBloc {}

class MockBreedState extends Fake implements CatBreedsState {}

void main() {
  group('description', () {
    late MockCatBreedsBloc catBreedsBloc;
    late List<CatBreedsEntity> catBreeds;
    setUp(() {
      catBreeds = CatBreedsEntityDataBuilder().buildList(10);
      catBreedsBloc = MockCatBreedsBloc();
    });

    testWidgets(
        'should render Scaffold with AppBar and ListView when not loading',
        (WidgetTester tester) async {
      // Arrange
      when(() => catBreedsBloc.state).thenReturn(MockBreedState());
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<CatBreedsBloc>.value(
            value: catBreedsBloc,
            child: const HomeScreen(),
          ),
        ),
      );
      final catBreedCardFinder = find.byType(CatBreedCard);

      // Assert
      expect(catBreedCardFinder, findsOneWidget);
    });
  });
}
