import 'package:hyll_test/models/adventure_model.dart';

import '../utils/meta_strings.dart';
import 'package:http/http.dart' as http;

class AdventureRepository {
  AdventureRepository();
  Map<String, String>? headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<AdventureModel> getAdventures(int limit, int offset,{bool isFirstFetch=false}) async {
    String url = '${MetaStrings.baseUrl}${MetaStrings.getAdventuresList}${isFirstFetch?'':'?limit=$limit&offset=$offset'}';
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return adventureModelFromJson(response.body);
    } else {
      throw Exception('Failed to load adventures');
    }
  }
}
