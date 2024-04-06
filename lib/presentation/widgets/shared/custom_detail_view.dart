import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:flutter/material.dart';

class CustomDetailView extends StatelessWidget {
  final CatBreedsEntity breed;
  const CustomDetailView({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              _ScoreWidget(
                  title: 'AffectionLevel', score: breed.affectionLevel),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'ChildFriendly', score: breed.childFriendly),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'DogFriendly', score: breed.dogFriendly),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'EnergyLevel', score: breed.energyLevel),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'Grooming', score: breed.grooming),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'HealthIssues', score: breed.healthIssues),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'Intelligence', score: breed.intelligence),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'SocialNeeds', score: breed.socialNeeds),
              const SizedBox(height: 5.0),
              _ScoreWidget(
                  title: 'StrangerFriendly', score: breed.strangerFriendly),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'Vocalisation', score: breed.vocalisation),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'SheddingLevel', score: breed.sheddingLevel),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'Adaptability', score: breed.adaptability),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'Natural', score: breed.natural),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'Experimental', score: breed.experimental),
              const SizedBox(height: 5.0),
              _ScoreWidget(title: 'Hairless', score: breed.hairless),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({required this.title, required this.score});

  final String title;
  final int score;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title ',
          style: textStyle.bodyLarge,
        ),
        const Spacer(),
        for (int i = 0; i < 5; i++)
          i < score
              ? Icon(Icons.star, color: Theme.of(context).colorScheme.primary)
              : Icon(Icons.star_border,
                  color: Theme.of(context).colorScheme.primary),
      ],
    );
  }
}
