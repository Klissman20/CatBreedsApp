class CatBreedsEntity {
  final String id;
  final String name;
  final String description;
  final String? referenceImageId;
  final String origin;
  final String temperament;
  final int intelligence;
  final int adaptability;
  final String lifeSpan;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;

  const CatBreedsEntity(
      {required this.id,
      required this.origin,
      required this.temperament,
      required this.intelligence,
      required this.adaptability,
      required this.lifeSpan,
      required this.name,
      required this.description,
      required this.affectionLevel,
      required this.childFriendly,
      required this.dogFriendly,
      required this.energyLevel,
      required this.grooming,
      required this.healthIssues,
      required this.sheddingLevel,
      required this.socialNeeds,
      required this.strangerFriendly,
      required this.vocalisation,
      required this.experimental,
      required this.hairless,
      required this.natural,
      this.referenceImageId});
}
