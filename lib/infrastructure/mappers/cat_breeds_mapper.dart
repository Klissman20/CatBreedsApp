import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/infrastructure/models/cat_breeds_model.dart';

class CatBreedsMapper {
  static CatBreedsEntity catBreedsToEntity(CatBreedsModel catModel) {
    return CatBreedsEntity(
      id: catModel.id,
      name: catModel.name,
      temperament: catModel.temperament,
      origin: catModel.origin,
      description: catModel.description,
      lifeSpan: catModel.lifeSpan,
      adaptability: catModel.adaptability,
      intelligence: catModel.intelligence,
      referenceImageId: catModel.referenceImageId,
    );
  }
}
