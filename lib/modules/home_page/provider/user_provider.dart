import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pocnotes/modules/home_page/model/user_data_model.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<List<UserDataModel>> getUserList() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    setIsLoading(false);
    Iterable l = json.decode(response.body);
    var userList = List<UserDataModel>.from(
        l.map((model) => UserDataModel.fromJson(model)));

    return userList;
  }
}
