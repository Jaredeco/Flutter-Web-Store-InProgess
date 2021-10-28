import 'package:cloud_firestore/cloud_firestore.dart';

class BagItemModel {
  final String? id;
  final String? productId;
  final String? productQuantity;

  BagItemModel({
    this.id,
    this.productId,
    this.productQuantity,
  });

  factory BagItemModel.fromDocSnapshot(DocumentSnapshot snapshot) {
    return BagItemModel(
        id: snapshot.id,
        productId: snapshot["productId"],
        productQuantity: snapshot["productQuantity"]);
  }
}
