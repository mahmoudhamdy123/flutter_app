import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../item.dart';
import '../lap.dart';



class Design extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Item>(context, listen: false);
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: Image.network(item.url),
          title: Text(item.title),
          subtitle: Text(item.price),
        ),
      ),
    );
  }
}
