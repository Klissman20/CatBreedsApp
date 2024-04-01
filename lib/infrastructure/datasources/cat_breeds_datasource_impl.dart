import 'dart:convert';
import 'package:cat_breeds_app/config/environment/environment.dart';
import 'package:cat_breeds_app/domain/datasources/cat_breeds_datasource.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/infrastructure/mappers/cat_breeds_mapper.dart';
import 'package:cat_breeds_app/infrastructure/models/cat_breeds_model.dart';
import 'package:http/http.dart' as http;

class CatBreedsDatasourceImpl implements CatBreedsDatasource {
  final Uri _url = Uri.https(
      'api.thecatapi.com', '/v1/breeds', {'x_api_key': Environment.apiKey});

  @override
  Future<List<CatBreedsEntity>> getBreeds() async {
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final dataList = List<CatBreedsModel>.from(
          data.map((item) => CatBreedsModel.fromJson(item)));
      final List<CatBreedsEntity> catBreeds = dataList
          .map((breeds) => CatBreedsMapper.catBreedsToEntity(breeds))
          .toList();
      return catBreeds;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
