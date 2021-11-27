import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webstore/models/product_model.dart';

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

  OrderModel(
      {this.id,
      this.bagProducts,
      this.createdAt,
      this.firstName,
      this.surname,
      this.country,
      this.street,
      this.psc,
      this.city,
      this.email,
      this.phone});

  factory OrderModel.fromDocSnapshot(DocumentSnapshot snapshot) {
    return OrderModel(
      id: snapshot.id,
      bagProducts: snapshot["bagProducts"].cast<String, int>(),
      createdAt: snapshot["createdAt"],
      firstName: snapshot["firstName"],
      surname: snapshot["surname"],
      country: snapshot["country"],
      street: snapshot["street"],
      psc: snapshot["psc"],
      city: snapshot["city"],
      email: snapshot["email"],
      phone: snapshot["phone"],
    );
  }
  Map<String, dynamic> toJson() => {
        "bagProducts": bagProducts,
        "createdAt": createdAt,
        "firstName": firstName,
        "surname": surname,
        "country": country,
        "street": street,
        "psc": psc,
        "city": city,
        "email": email,
        "phone": phone,
      };
}
