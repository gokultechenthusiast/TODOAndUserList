import 'package:flutter/material.dart';
import 'package:pocnotes/modules/home_page/widgets/todo.dart';
import 'package:pocnotes/modules/home_page/widgets/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TodoBody(),
    UserBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: _children[
          _currentIndex], // TODO:- need to create a list of widgets for 2 pages
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "ToDo's",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User's")
        ],
        currentIndex: _currentIndex,
      ),
    );
  }
}
