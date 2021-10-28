import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? country;
  final String? town;
  final String? address;
  final String? email;
  final String? phoneNumber;

  CustomerModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.country,
      this.town,
      this.address,
      this.email,
      this.phoneNumber});

  factory CustomerModel.fromDocSnapshot(DocumentSnapshot snapshot) {
    return CustomerModel(id: snapshot.id, 
    firstName:snapshot["firstName"],
    lastName:snapshot["lastName"],
    country:snapshot["country"],
    town:snapshot["town"],
    address:snapshot["address"],
    email:snapshot["email"],
    phoneNumber:snapshot["phoneNumber"]);
  }
}
