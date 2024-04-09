import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';

class CatBreedsEntityDataBuilder {
  String id = 'default_id';
  String name = 'default_name';
  String description = 'default_description';
  String? referenceImageId;
  String origin = 'default_origin';
  String temperament = 'default_temperament';
  int intelligence = 1;
  int adaptability = 1;
  String lifeSpan = 'default_life_span';
  int affectionLevel = 1;
  int childFriendly = 1;
  int dogFriendly = 1;
  int energyLevel = 1;
  int grooming = 1;
  int healthIssues = 1;
  int sheddingLevel = 1;
  int socialNeeds = 1;
  int strangerFriendly = 1;
  int vocalisation = 1;
  int experimental = 1;
  int hairless = 1;
  int natural = 1;

  CatBreedsEntityDataBuilder();

  CatBreedsEntityDataBuilder withId(String id) {
    this.id = id;
    return this;
  }

  CatBreedsEntityDataBuilder withName(String name) {
    this.name = name;
    return this;
  }

  CatBreedsEntityDataBuilder withDescription(String description) {
    this.description = description;
    return this;
  }

  CatBreedsEntityDataBuilder withReferenceImageId(String? referenceImageId) {
    this.referenceImageId = referenceImageId;
    return this;
  }

  CatBreedsEntityDataBuilder withOrigin(String origin) {
    this.origin = origin;
    return this;
  }

  CatBreedsEntityDataBuilder withTemperament(String temperament) {
    this.temperament = temperament;
    return this;
  }

  CatBreedsEntityDataBuilder withIntelligence(int intelligence) {
    this.intelligence = intelligence;
    return this;
  }

  CatBreedsEntityDataBuilder withAdaptability(int adaptability) {
    this.adaptability = adaptability;
    return this;
  }

  CatBreedsEntityDataBuilder withLifeSpan(String lifeSpan) {
    this.lifeSpan = lifeSpan;
    return this;
  }

  CatBreedsEntityDataBuilder withAffectionLevel(int affectionLevel) {
    this.affectionLevel = affectionLevel;
    return this;
  }

  CatBreedsEntityDataBuilder withChildFriendly(int childFriendly) {
    this.childFriendly = childFriendly;
    return this;
  }

  CatBreedsEntityDataBuilder withDogFriendly(int dogFriendly) {
    this.dogFriendly = dogFriendly;
    return this;
  }

  CatBreedsEntityDataBuilder withEnergyLevel(int energyLevel) {
    this.energyLevel = energyLevel;
    return this;
  }

  CatBreedsEntityDataBuilder withGrooming(int grooming) {
    this.grooming = grooming;
    return this;
  }

  CatBreedsEntityDataBuilder withHealthIssues(int healthIssues) {
    this.healthIssues = healthIssues;
    return this;
  }

  CatBreedsEntityDataBuilder withSheddingLevel(int sheddingLevel) {
    this.sheddingLevel = sheddingLevel;
    return this;
  }

  CatBreedsEntityDataBuilder withSocialNeeds(int socialNeeds) {
    this.socialNeeds = socialNeeds;
    return this;
  }

  CatBreedsEntityDataBuilder withStrangerFriendly(int strangerFriendly) {
    this.strangerFriendly = strangerFriendly;
    return this;
  }

  CatBreedsEntityDataBuilder withVocalisation(int vocalisation) {
    this.vocalisation = vocalisation;
    return this;
  }

  CatBreedsEntityDataBuilder withExperimental(int experimental) {
    this.experimental = experimental;
    return this;
  }

  CatBreedsEntityDataBuilder withHairless(int hairless) {
    this.hairless = hairless;
    return this;
  }

  CatBreedsEntityDataBuilder withNatural(int natural) {
    this.natural = natural;
    return this;
  }

  CatBreedsEntity build() {
    return CatBreedsEntity(
      id: id,
      name: name,
      description: description,
      referenceImageId: referenceImageId,
      origin: origin,
      temperament: temperament,
      intelligence: intelligence,
      adaptability: adaptability,
      lifeSpan: lifeSpan,
      affectionLevel: affectionLevel,
      childFriendly: childFriendly,
      dogFriendly: dogFriendly,
      energyLevel: energyLevel,
      grooming: grooming,
      healthIssues: healthIssues,
      sheddingLevel: sheddingLevel,
      socialNeeds: socialNeeds,
      strangerFriendly: strangerFriendly,
      vocalisation: vocalisation,
      experimental: experimental,
      hairless: hairless,
      natural: natural,
    );
  }

  List<CatBreedsEntity> buildList(int length) {
    List<CatBreedsEntity> list = [];
    for (int i = 0; i < length; i++) {
      list.add(
          CatBreedsEntityDataBuilder().withId('$i').withName('name$i').build());
    }
    return list;
  }
}
