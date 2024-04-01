import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:flutter/material.dart';

class CatBreedCard extends StatelessWidget {
  final CatBreedsEntity catBreed;
  const CatBreedCard({super.key, required this.catBreed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                catBreed.name,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w800),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Image.network(
                catBreed.referenceImageId != null
                    ? 'https://cdn2.thecatapi.com/images/${catBreed.referenceImageId}.jpg'
                    : 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loading) {
                  if (loading == null) {
                    return child;
                  }
                  return const CircularProgressIndicator(
                    color: Colors.black,
                  );
                },
                width: size.width,
                height: 300,
                scale: 0.7,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
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
