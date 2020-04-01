import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'lap.dart';

class test with ChangeNotifier{


  Future<void> mtest(String model,String type){
//    Firestore.instance.collection("products").document("ln3TlMi8P5wopTO8AMb0")
//        .collection("lap").document("J9g81qGRHFKTzznsHiP3").collection(model).document().setData({
//      "url":"d",
//      "title":"dwf"
//    });
//
//    Firestore.instance.collection("products").document("ln3TlMi8P5wopTO8AMb0")
//        .collection("lap").document("J9g81qGRHFKTzznsHiP3").collection(model).getDocuments().then((QuerySnapshot snap){
//          List<> test = snap.documents;
//    });


//    Firestore.instance.collection("products").document("ln3TlMi8P5wopTO8AMb0")
//        .collection("lap").getDocuments().then((QuerySnapshot snap){
//      List<Any> test = snap.documents;
//    });

   List<Lap> _item=[];
        Firestore.instance.collection("products").document("ln3TlMi8P5wopTO8AMb0")
        .collection("lap").document("J9g81qGRHFKTzznsHiP3").collection(model).getDocuments().then((QuerySnapshot snap){
          List<DocumentSnapshot> test = snap.documents;
          test.forEach((data)=>{
            _item.add(
              Lap(title: data.data['title'],url: data.data["url"]),
            )
          });
    });


  }

}