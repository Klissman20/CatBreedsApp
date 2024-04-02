import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:flutter/material.dart';

class CatBreedCard extends StatelessWidget {
  final CatBreedsEntity catBreed;
  const CatBreedCard({super.key, required this.catBreed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
        elevation: 10.0,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                catBreed.name,
                style: const TextStyle(
                    fontSize: 22.0, fontWeight: FontWeight.w800),
              ),
            ),
            catBreed.referenceImageId != null
                ? Image.network(
                    'https://cdn2.thecatapi.com/images/${catBreed.referenceImageId}.jpg',
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loading) {
                      if (loading == null) {
                        return child;
                      }
                      return const CircularProgressIndicator(
                        strokeWidth: 2.0,
                        color: Colors.black,
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/image_not_available.png');
                    },
                    width: size.width,
                    height: 300,
                    scale: 0.7,
                    fit: BoxFit.contain,
                  )
                : Image.asset('assets/image_not_available.png'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Origin: ${catBreed.origin}',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    Text('IQ: ${catBreed.intelligence.toString()}',
                        style: const TextStyle(fontSize: 20.0))
                  ]),
            )
          ],
        ));
  }
}
