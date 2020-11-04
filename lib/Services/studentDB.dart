import 'package:cloud_firestore/cloud_firestore.dart';

class StudentDB {
  // ignore: deprecated_member_use
  final CollectionReference studentdb = Firestore.instance.collection('studDB');

  final String id;
  StudentDB({this.id});

  Future createStudent(int studID, String password) async {
    // ignore: deprecated_member_use
    return await studentdb.document(id).setData({
      'studentID': studID,
      'password': password,
    });
  }
}
