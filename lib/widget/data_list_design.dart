

import 'package:flutter/material.dart';
import 'package:flutterapp/screen/data_screen.dart';
import 'package:provider/provider.dart';

import '../lap.dart';


class DataListDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lap = Provider.of<Lap>(context, listen: false);
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(DataScreen.routeName,arguments: lap.title);
          },
          child: ListTile(
            leading: Image.network(lap.url),
            title: Text(lap.title),
          ),
        ),
      ),
    );
  }
}
