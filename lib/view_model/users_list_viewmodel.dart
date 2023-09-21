import 'package:flutter/material.dart';
import 'package:mvvm_practice/model/users_list_model.dart';
import 'package:mvvm_practice/repo/users_repo.dart';

class UsersListViewModel with ChangeNotifier {
  final _myRepo = UsersRepository();


  Future<UsersListModel> getUsersApi() async {
    final response = await _myRepo.usersListApi();
    return UsersListModel.fromJson(response);
  }
}
