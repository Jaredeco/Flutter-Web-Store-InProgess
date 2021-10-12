import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";

  String? id;
  String? name;
  String? email;

  UserModel(this.id, this.name, this.email);

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = (snapshot.data() as dynamic)[NAME];
    email = (snapshot.data() as dynamic)[EMAIL];
    id = (snapshot.data() as dynamic)[ID];
  }
}