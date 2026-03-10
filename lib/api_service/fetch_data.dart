import 'dart:convert';

import 'package:stajproje/models/product_model.dart';

import 'package:http/http.dart' as http;

class ApiService {
  Future<ProductModel> fetchData() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return ProductModel.fromJson(data);
    } else {
      throw Exception("Veriler yüklenemedi");
    }
  }

  Future<ProductModel> fetchSearchedData(String querry) async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products/search?q=$querry"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return ProductModel.fromJson(data);
    } else {
      throw Exception("Veriler yüklenemedi");
    }
  }
}
