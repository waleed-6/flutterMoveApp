
import 'package:flutter/material.dart';
import 'package:movie/home_page.dart';
void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,

        ),
        home: HomePage());

  }
}
