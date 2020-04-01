import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widget/design.dart';
import 'package:provider/provider.dart';

import '../item.dart';




class DataList extends StatefulWidget {
  final String state;

  const DataList({this.state});
  @override
  _DataListState createState() => _DataListState(state);
}

class _DataListState extends State<DataList> {
  String state;
  _DataListState(this.state);
  @override
  Widget build(BuildContext context) {
    print("1");
    final databaseReference = Firestore.instance;
    final List<Item> allItems = [];
    return StreamBuilder<QuerySnapshot>(
        stream:Firestore.instance.collection("products").document("ln3TlMi8P5wopTO8AMb0")
            .collection("lap").document(state).collection("Data").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("2");
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            print("3");
            return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.amber,
                ));
          }
          final Items = snapshot.data.documents;
          allItems.clear();
          for (var item in Items) {
            allItems.add(
                Item(url: item.data["url"],title:  item.data["title"],price:item.data["price"] )
            );
          }
          if (allItems.length == 0) {
            return Center(
              child: Text('There are no item'), //
            );
          }
          return Padding(
            padding:EdgeInsets.only(top: 7,left: 7,right: 7),
            child:  Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: allItems.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: allItems[i],
                  child: Design(),
                ),
              ),
            ),
          );
        });
  }
}
