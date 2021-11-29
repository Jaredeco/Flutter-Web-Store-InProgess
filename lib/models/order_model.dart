import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String? id;
  final Timestamp? createdAt;
  final Map<String, int>? bagProducts;
  final String? firstName;
  final String? surname;
  final String? country;
  final String? street;
  final String? psc;
  final String? city;
  final String? email;
  final String? phone;
  final double? total;
  final bool? resolved;

  OrderModel(
      {this.id,
      this.createdAt,
      this.bagProducts,
      this.firstName,
      this.surname,
      this.country,
      this.street,
      this.psc,
      this.city,
      this.email,
      this.phone,
      this.total,
      this.resolved});

  factory OrderModel.fromDocSnapshot(DocumentSnapshot snapshot) {
    return OrderModel(
        id: snapshot.id,
        createdAt: snapshot["createdAt"],
        bagProducts: snapshot["bagProducts"].cast<String, int>(),
        firstName: snapshot["firstName"],
        surname: snapshot["surname"],
        country: snapshot["country"],
        street: snapshot["street"],
        psc: snapshot["psc"],
        city: snapshot["city"],
        email: snapshot["email"],
        phone: snapshot["phone"],
        total: snapshot["total"],
        resolved: snapshot["resolved"]);
  }
  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "bagProducts": bagProducts,
        "firstName": firstName,
        "surname": surname,
        "country": country,
        "street": street,
        "psc": psc,
        "city": city,
        "email": email,
        "phone": phone,
        "total": total,
        "resolved": resolved,
      };
}
