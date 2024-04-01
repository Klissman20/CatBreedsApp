import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/presentation/widgets/cat_breeds/cat_breed_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ex = [
      const CatBreedsEntity(
          id: '1',
          name: 'Gato',
          temperament: '12',
          origin: 'Colombia',
          description: 'Gato con botas',
          lifeSpan: '10 - 15',
          adaptability: 0,
          intelligence: 0,
          referenceImageId: '0XYvRd7oD'),
      const CatBreedsEntity(
          id: '2',
          name: 'Aegean',
          temperament: '12',
          origin: 'Greece',
          description: 'Gato con botas',
          lifeSpan: '10 - 15',
          adaptability: 0,
          intelligence: 5),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Breeds'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemCount: ex.length,
        itemBuilder: (context, index) {
          return CatBreedCard(
            catBreed: ex[index],
          );
        },
      ),
    );
  }
}
