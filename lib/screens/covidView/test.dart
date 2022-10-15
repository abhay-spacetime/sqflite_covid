import 'dart:convert';

import '../../service/model/covid_model.dart';
import 'package:http/http.dart' as http;

Future<List<CovidModel>> fetchCovidFromApi() async {
  final response = await http.get(
    Uri.parse('https://api.covidtracking.com/v1/us/daily.json'),
  );

  if (response.statusCode == 200) {
    List<CovidModel> users = (json.decode(response.body) as List)
        .map((data) => CovidModel.fromJson(data))
        .toList();

    return users;
  } else {
    throw Exception('Failed to load album');
  }
}
