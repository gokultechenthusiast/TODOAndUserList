import 'package:flutter/material.dart';
import 'package:pocnotes/modules/home_page/model/todo_data_model.dart';
import 'package:pocnotes/modules/home_page/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoBody extends StatelessWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoProvider>(
      builder: (context, toDoProvider, child) =>
          FutureBuilder<List<TODODataModel>>(
        future: toDoProvider.getToDoList(),
        builder: (context, AsyncSnapshot<List<TODODataModel>> snapshot) {
          if (toDoProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            // if there is data then the list
            if (snapshot.hasData) {
              debugPrint("Snapshot data :- ${snapshot.data}");
              // if the length of data is not 0 then show list
              return snapshot.data!.length != 0
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data![index].title ?? ""),
                        trailing: snapshot.data![index].completed!
                            ? Icon(
                                Icons.assignment_turned_in_outlined,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.assignment_turned_in_outlined,
                                color: Colors.red,
                              ),
                      ),
                    )
                  : Text("No "
                      "data "
                      "found!");
            } else {
              // when there is error
              return Center(
                child: Text("No data found!"),
              );
            }
          }
        },
      ),
    );
  }
}
