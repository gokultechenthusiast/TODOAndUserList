import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pocnotes/modules/home_page/model/todo_data_model.dart';

class ToDoProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<List<TODODataModel>> getToDoList() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await http.get(url);
    debugPrint("Responce:- ${response.toString()}");
    setIsLoading(false);
    Iterable l = json.decode(response.body);
    debugPrint("ToDo Array:- ${l.toString()}");
    var toDoList = List<TODODataModel>.from(
        l.map((model) => TODODataModel.fromJson(model)));

    return toDoList;
  }
}
