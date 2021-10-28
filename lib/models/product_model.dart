import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? id;
  final String? title;
  final String? imageUrl;
  final int? price;
  final String? description;

  ProductModel({this.id, this.title, this.imageUrl, this.price, this.description});

  factory ProductModel.fromDocSnapshot(DocumentSnapshot snapshot) {
    return ProductModel(
    id: snapshot.id,
    imageUrl: snapshot["imageUrl"],
    title: snapshot["title"],
    price: snapshot["price"],
    description: snapshot["description"]);
  }
}
