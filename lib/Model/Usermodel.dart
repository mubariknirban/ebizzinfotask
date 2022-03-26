import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String age;
  final String dob;
  UserModel(
      {
        required this.name,
        required this.email,
        required this.age,
        required this.dob});

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'email': email,
      'age': age,
      'dob': dob,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      :
        name = doc.data()!["Name"],
        email = doc.data()!["email"],
        age = doc.data()!["age"],
        dob = doc.data()!["dob"];

}