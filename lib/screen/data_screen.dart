import 'package:flutter/material.dart';
import 'package:flutterapp/widget/data_list.dart';



class DataScreen extends StatefulWidget {
  static String routeName="/DataScreen";
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  String title;
  @override
  Widget build(BuildContext context) {
    title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: DataList(state: title,),
    );
  }
}

