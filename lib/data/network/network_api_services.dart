// inside network : we handle api calls and responses
// implement base abstract class for all api call methods
// this reduce redundent code for every api calls

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_practice/data/app_exceptions.dart';
import 'package:mvvm_practice/data/network/base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await post(
        Uri.parse(url),
        body: data,
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }

    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw BadRequestException(response.body);
      case 404:
        throw UnauthorizedException(response.body);
      default:
        throw FetchDataException(
            "Error while communicating with server, Error code: ${response.statusCode}");
    }
  }
}
