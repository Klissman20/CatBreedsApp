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

  const CatBreedsEntity(
      {required this.id,
      required this.origin,
      required this.temperament,
      required this.intelligence,
      required this.adaptability,
      required this.lifeSpan,
      required this.name,
      required this.description,
      this.referenceImageId});
}
