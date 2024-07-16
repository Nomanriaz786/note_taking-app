//Muhammad Noman Riaz
//21-Arid-4010

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future addRecord(Map<String, dynamic> record, String id) async {
    FirebaseFirestore.instance.collection('Person').doc(id).set(record);
  }

  Future<Stream<QuerySnapshot>> getPersonRecord() async {
    return FirebaseFirestore.instance.collection('Person').snapshots();
  }

  Future updateRecord(Map<String, dynamic> record, String id) async {
    FirebaseFirestore.instance.collection('Person').doc(id).update(record);
  }

  Future deleteRecord(String id) async {
    return await FirebaseFirestore.instance
        .collection('Person')
        .doc(id)
        .delete();
  }
}
