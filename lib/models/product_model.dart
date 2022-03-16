import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? id;
  final Timestamp? createAt;
  final String? title;
  final List<String>? imgsUrl;
  final double? price;
  final String? descriptionTop;
  final String? descriptionBottom;
  final List<String>? options;

  ProductModel({
    this.id,
    this.createAt,
    this.title,
    this.imgsUrl,
    this.price,
    this.descriptionTop,
    this.descriptionBottom,
    this.options,
  });

  factory ProductModel.fromDocSnapshot(DocumentSnapshot snapshot) {
    return ProductModel(
        id: snapshot.id,
        createAt: snapshot["createdAt"],
        imgsUrl: snapshot["imgsUrl"].cast<String>(),
        title: snapshot["title"],
        price: snapshot["price"],
        descriptionTop: snapshot["descriptionTop"],
        descriptionBottom: snapshot["descriptionBottom"],
        options: snapshot["options"].cast<String>());
  }
  Map<String, dynamic> toJson() => {
        'createdAt': createAt,
        'imgsUrl': imgsUrl,
        'title': title,
        'price': price,
        'descriptionTop': descriptionTop,
        'descriptionBottom': descriptionBottom,
        'options': options,
      };
}
