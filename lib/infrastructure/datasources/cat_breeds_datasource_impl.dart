import 'dart:convert';
import 'package:cat_breeds_app/config/environment/environment.dart';
import 'package:cat_breeds_app/domain/datasources/cat_breeds_datasource.dart';
import 'package:cat_breeds_app/domain/entities/cat_breed_entity.dart';
import 'package:cat_breeds_app/infrastructure/mappers/cat_breeds_mapper.dart';
import 'package:cat_breeds_app/infrastructure/models/cat_breeds_model.dart';
import 'package:cat_breeds_app/infrastructure/shared/http_client/http_client.dart';

const _authority = 'api.thecatapi.com';
const _breedsPath = '/v1/breeds';
const _searchPath = '/v1/breeds/search';
final apiKey = Environment.apiKey;

class CatBreedsDatasourceImpl implements CatBreedsDatasource {
  final HttpClient httpClient;
  CatBreedsDatasourceImpl(this.httpClient) : super();

  @override
  Future<List<CatBreedsEntity>> getBreeds({int page = 1}) async {
    final queryParams = <String, dynamic>{'x_api_key': apiKey};
    final uri = Uri.https(_authority, _breedsPath, queryParams);
    final response = await httpClient.getRequest(uri);
    final data = jsonDecode(response);
    final catBreedList = List<CatBreedsModel>.from(
        data.map((item) => CatBreedsModel.fromJson(item)));
    return catBreedList.map(CatBreedsMapper.catBreedsToEntity).toList();
  }

  @override
  Future<List<CatBreedsEntity>> searchBreeds(String query) async {
    if (query.isEmpty) return [];
    final queryParams = <String, dynamic>{'q': query, 'x_api_key': apiKey};
    final uri = Uri.https(_authority, _searchPath, queryParams);
    final response = await httpClient.getRequest(uri);
    final data = jsonDecode(response);
    final catBreedList = List<CatBreedsModel>.from(
        data.map((item) => CatBreedsModel.fromJson(item)));
    return catBreedList.map(CatBreedsMapper.catBreedsToEntity).toList();
  }

  @override
  Future<CatBreedsEntity> getBreedById({required String breedId}) async {
    final queryParams = <String, dynamic>{'x_api_key': apiKey};
    final uri = Uri.https(_authority, '$_breedsPath/$breedId', queryParams);
    final response = await httpClient.getRequest(uri);
    final data = jsonDecode(response);
    final dataToModel = CatBreedsModel.fromJson(data);
    final CatBreedsEntity catBreed =
        CatBreedsMapper.catBreedsToEntity(dataToModel);
    return catBreed;
  }
}
