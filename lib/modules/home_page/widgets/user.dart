import 'package:flutter/material.dart';
import 'package:pocnotes/modules/home_page/model/user_data_model.dart';
import 'package:pocnotes/modules/home_page/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserBody extends StatelessWidget {
  const UserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) =>
          FutureBuilder<List<UserDataModel>>(
        future: userProvider.getUserList(),
        builder: (context, AsyncSnapshot<List<UserDataModel>> snapshot) {
          if (userProvider.isLoading) {
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
                        title: Text(snapshot.data![index].name ?? ""),
                        subtitle: Text(snapshot.data![index].email ?? ""),
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
