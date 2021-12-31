import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? id;
  final Timestamp? createAt;
  final String? title;
  final List<String>? imgsUrl;
  final double? price;
  final String? description;

  ProductModel(
      {this.id,
      this.createAt,
      this.title,
      this.imgsUrl,
      this.price,
      this.description});

  factory ProductModel.fromDocSnapshot(DocumentSnapshot snapshot) {
    return ProductModel(
        id: snapshot.id,
        createAt: snapshot["createdAt"],
        imgsUrl: snapshot["imgsUrl"].cast<String>(),
        title: snapshot["title"],
        price: snapshot["price"],
        description: snapshot["description"]);
  }
  Map<String, dynamic> toJson() => {
        'createdAt': createAt,
        'imgsUrl': imgsUrl,
        'title': title,
        'price': price,
        'description': description,
      };
}
