import 'package:cat_breeds_app/infrastructure/models/cat_breeds_model.dart';

class CatBreedsMappers {
  static CatBreedsModel fromJson(Map<String, dynamic> json) {
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
}
