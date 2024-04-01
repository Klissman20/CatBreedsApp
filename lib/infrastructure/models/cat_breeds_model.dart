class CatBreedsModel {
  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;
  final String lifeSpan;
  final int adaptability;
  final int intelligence;
  final String? referenceImageId;

  CatBreedsModel({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.intelligence,
    this.referenceImageId,
  });

  factory CatBreedsModel.fromJson(Map<String, dynamic> json) {
    return CatBreedsModel(
      id: json['id'],
      name: json['name'],
      temperament: json['temperament'],
      origin: json['origin'],
      description: json['description'],
      lifeSpan: json['life_span'],
      adaptability: json['adaptability'],
      intelligence: json['intelligence'],
      referenceImageId: json['reference_image_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "temperament": temperament,
        "origin": origin,
        "description": description,
        "life_span": lifeSpan,
        "adaptability": adaptability,
        "intelligence": intelligence,
        "reference_image_id": referenceImageId,
      };
}
