import 'package:custom_qr_code/custom_qr_code/models/img.dart';
import 'package:custom_qr_code/custom_qr_code/models/img_results.dart';

import 'package:custom_qr_code/custom_qr_code/data/constants.dart';
import 'package:custom_qr_code/custom_qr_code/data/rest_client.dart';

class ApiProvider {
  static final ApiProvider _api = ApiProvider._internal();

  ApiProvider._internal();

  factory ApiProvider() => _api;

  final _restClient = RestClient();

  Future<List<Img>> searchImages(String keyword) async {
    String url = Constants.SEARCH_URL + keyword;

    var results = await _restClient
        .getHttps(url)
        .then((res) => ImgResults.fromJson(res).hits.toList())
        .catchError((error) => throw error);

    return results;
  }
}
