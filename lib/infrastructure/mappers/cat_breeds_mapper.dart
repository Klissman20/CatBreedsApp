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
      affectionLevel: catModel.affectionLevel,
      childFriendly: catModel.childFriendly,
      dogFriendly: catModel.dogFriendly,
      energyLevel: catModel.energyLevel,
      grooming: catModel.grooming,
      healthIssues: catModel.healthIssues,
      sheddingLevel: catModel.sheddingLevel,
      socialNeeds: catModel.socialNeeds,
      strangerFriendly: catModel.strangerFriendly,
      vocalisation: catModel.vocalisation,
      experimental: catModel.experimental,
      hairless: catModel.hairless,
      natural: catModel.natural,
    );
  }
}
