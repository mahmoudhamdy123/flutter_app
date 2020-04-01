import 'package:flutter/material.dart';
import 'package:flutterapp/item.dart';
import 'package:flutterapp/screen/data_screen.dart';
import 'package:flutterapp/widget/item_data.dart';
import 'package:provider/provider.dart';

import 'lap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Lap(),
        ),
        ChangeNotifierProvider.value(
          value: Item(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Start(),
        routes: {
          DataScreen.routeName: (context) => DataScreen(),
          Home.routeName: (context) => Home(),
        },
      ),
    );
  }
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Home.routeName);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image.network(
                      "https://d2pa5gi5n2e1an.cloudfront.net/global/images/product/laptops/Lenovo_Ideapad_S300/Lenovo_Ideapad_S300_L_1.jpg"),
                  Text("Lap")
                ],
              ),
              color: Colors.teal[100],
            ),
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  static String routeName="/Home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ItemData(),
    );
  }
}
