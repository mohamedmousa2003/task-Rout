import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../const/api_const.dart';
import '../../data/models/SourceModel.dart';

class ApiManager {
  static Future<SourceModel> getAllProduct() async {
      Uri url = Uri.https(
          apiBaseUrl,
          apiGetProducts
      );
      var response = await http.get(url);

      var getAllProductResponse =
      SourceModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200 ) {
        //? success get data
        return  getAllProductResponse;
      }  else {
        throw Exception('Failed to load sources');
      }
  }
}