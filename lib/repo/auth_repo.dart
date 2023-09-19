// inside [data]>[network] : 1. api call methods, 2. try-catch handling,
// 3. return decode(json)
// now, inside here, ecap Apis according to their use-cases,
// for ex: AuthRespository encaps all Authentication related Api's using AppUrls,
// that simply call and pass data

import 'package:mvvm_practice/data/network/base_api_services.dart';
import 'package:mvvm_practice/data/network/network_api_services.dart';
import 'package:mvvm_practice/res/app_urls.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    dynamic response =
        await _apiServices.getPostApiResponse(AppUrls.loginEndPoint, data);
    return response;
  }

  Future<dynamic> signUpApi(dynamic data) async {
    dynamic response =
        await _apiServices.getPostApiResponse(AppUrls.signupEndPoint, data);
    return response;
  }
}
