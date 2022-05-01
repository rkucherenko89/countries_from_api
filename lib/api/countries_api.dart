import 'dart:convert';

import 'package:countries_from_api/models/country.dart';
import 'package:http/http.dart' as http;

class CountriesApi {
  static Future<List<Country>> getCoutries(String query) async {
    final response = await http.get(Uri.https('restcountries.com', 'v3.1/all'));
    if (response.statusCode == 200) {
      final List countries = jsonDecode(response.body);
      return countries.map((json) => Country.fromJson(json)).where((country) {
        final nameLower = country.name.toLowerCase();
        final fullNameLower = country.fullName.toLowerCase();
        final searchLower = query.toLowerCase();

        return nameLower.contains(searchLower) ||
            fullNameLower.contains(searchLower);
      }).toList()
        ..sort((a, b) => a.name.compareTo(b.name));
    } else {
      throw Exception();
    }
  }

  static Future<List<Country>> getCoutriesByLanguage(String query) async {
    final response =
        await http.get(Uri.https('restcountries.com', 'v3.1/lang/$query'));
    if (response.statusCode == 200) {
      final List countries = jsonDecode(response.body);
      return countries.map((json) => Country.fromJson(json)).toList();
      // ..sort((a, b) => a.name.compareTo(b.name));
    } else {
      throw Exception();
    }
  }
}
