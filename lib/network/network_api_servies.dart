import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_maps/uses_cases/app_exception.dart';
import 'package:http/http.dart' as http;
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  static var client = http.Client();

  // get api
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response =
      await client.get(Uri.parse(url)).timeout(const Duration(seconds: 59));
      responseJson = returnResponce(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }


  // handling responce
  dynamic returnResponce(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 202:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("Server Responce 400 :- ${responseJson.toString()}");
        return responseJson;

      case 401:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("Server Responce 401 :- ${responseJson.toString()}");

        return responseJson;

      case 403:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("Server Responce 403 :- ${responseJson.toString()}");

        return responseJson;

      case 404:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("Server Responce 404 :- ${responseJson.toString()}");

        return responseJson;

      case 422:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("Server Responce 422 :- ${responseJson.toString()}");
        return responseJson;

      case 500:
        dynamic responseJson = jsonDecode(response.body);
        debugPrint("Internal Server Error 500 :- ${responseJson.toString()}");
        return responseJson;

      default:
      //! throw FetchDataException(response.statusCode.toString());

        dynamic responseJson = jsonDecode(response.body);
        debugPrint(
            "Internal Server Error ${response.statusCode} :- ${responseJson.toString()}");
        return responseJson;
    }
  }
}