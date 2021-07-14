import 'dart:io';
import 'dart:convert';
import '../../Utils/Globals.dart' as global;
import 'package:http/http.dart' as http;
import 'app_exceptions.dart';

class Api {
  static Future<dynamic> httpPostRequest(String url, dynamic body) async {
    String apiUrl = global.API_URL + url;
    print(url);
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
        },
      );
      responseJson = jsonDecode(response.body);
    } on SocketException {
      throw FetchDataException("No Internet Available");
    }
    return responseJson;
  }

  static Future<dynamic> getRequestData(String url) async {
    String apiUrl = global.API_URL + url;
    print(url);
    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-type': 'application/json',
        },
      );
      print(response.body);
      responseJson = _returnListResponse(response);
      return responseJson;
    } on SocketException {
      print('Socket Exception');
      throw FetchDataException("No Internet Available");
    }
  }

  static Future<dynamic> postRequestData(String url, dynamic body) async {
    String apiUrl = global.API_URL + url;
    print(url);
    var responseJson;
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
        },
      );
      responseJson = _returnListResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException("No Internet Available");
    }
  }
}

dynamic _returnListResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorisedException(response.body.toString());
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
