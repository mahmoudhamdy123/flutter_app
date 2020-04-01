import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../lap.dart';
import 'data_list_design.dart';

class ItemData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("1");
    final databaseReference = Firestore.instance;
    final List<Lap> allLaps = [];
    return StreamBuilder<QuerySnapshot>(
        stream:Firestore.instance.collection("products").document("ln3TlMi8P5wopTO8AMb0")
            .collection("lap").snapshots(),
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
          final laps = snapshot.data.documents;
          allLaps.clear();
          for (var lap in laps) {
            allLaps.add(
              Lap(url: lap.data["url"],title:  lap.data["title"])
            );
          }
          if (allLaps.length == 0) {
            return Center(
              child: Text('There are no lap'), //
            );
          }
          return Padding(
            padding:EdgeInsets.only(top: 7,left: 7,right: 7),
            child:  Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: allLaps.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: allLaps[i],
                  child: DataListDesign(),
                ),
              ),
            ),
          );
        });
  }
}