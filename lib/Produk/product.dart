import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  String baseUrl = "https://motogpmerch.herokuapp.com/apiproduk/products/";
  Future<List> getAllProducts() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
