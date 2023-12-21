import 'dart:convert';

import 'package:ecommerce/core/network/Cache_Networ.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://student.valuxapps.com/api/';
  postRequest(
      {required String endPoint, required Map<String, dynamic> body}) async {
    http.Response response = await http.post(Uri.parse("$_baseUrl$endPoint"),
        body: body, headers: {'lang': 'en'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'There Was an Error in the Service ${response.statusCode}');
    }
  }

  getReuest({required String endPoint}) async {
    http.Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/$endPoint"),
        headers: {
          'lang': 'en',
        });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'There Was an Error in the Service ${response.statusCode}');
    }
  }
}
