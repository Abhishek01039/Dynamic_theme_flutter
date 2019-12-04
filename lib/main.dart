import 'dart:async';

import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: bloc.darkThemeEnabled,
        initialData: false,
        builder: (context, snapshot) {
          return MaterialApp(
            theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
            title: "Dynamic Theme",
            home: Scaffold(
              appBar: AppBar(
                title: Text("data"),
              ),
              drawer: Drawer(
                  child: ListView(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Center(
                        child: Text("Dark Theme"),
                      ),
                      Switch(
                        value: snapshot.data,
                        onChanged: bloc.changeTheme,
                      )
                    ],
                  )
                ],
              )),
            ),
          );
        });
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;

  get darkThemeEnabled => _themeController.stream;
}

var bloc = Bloc();
