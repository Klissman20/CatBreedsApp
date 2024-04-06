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

  CatBreedsModel({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.intelligence,
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
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      grooming: json['grooming'],
      healthIssues: json['health_issues'],
      sheddingLevel: json['shedding_level'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
      vocalisation: json['vocalisation'],
      experimental: json['experimental'],
      hairless: json['hairless'],
      natural: json['natural'],
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
        "affection_level": affectionLevel,
        "child_friendly": childFriendly,
        "dog_friendly": dogFriendly,
        "energy_level": energyLevel,
        "grooming": grooming,
        "health_issues": healthIssues,
        "shedding_level": sheddingLevel,
        "social_needs": socialNeeds,
        "stranger_friendly": strangerFriendly,
        "vocalisation": vocalisation,
        "experimental": experimental,
        "hairless": hairless,
        "natural": natural,
      };
}
