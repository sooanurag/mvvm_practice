import 'package:mvvm_practice/data/network/base_api_services.dart';
import 'package:mvvm_practice/data/network/network_api_services.dart';
import 'package:mvvm_practice/res/app_urls.dart';

class UsersRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> usersListApi() async {
    dynamic response = await _apiServices.getGetApiResponse(AppUrls.usersEndPoint);
    return response;
  }
}
